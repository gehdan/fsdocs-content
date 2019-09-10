.(".\functions.ps1")

$GitRepoPath = $PSScriptRoot;

$FSDocsBranch = GitCall rev-parse --abbrev-ref, HEAD
$FSVersion = $FSDocsBranch.SubString(0, $FSDocsBranch.IndexOf('/'));

if ($FSDocsBranch -ne ($FSVersion + "/master")){
    $Host.UI.WriteErrorLine("Publish nur im /master-Branch möglich. Aktueller Branch: " + $FSDocsBranch)
    exit 1
}

## Im fsdocs-Content-Repository darf es keine Changes geben.
$GitChanges = GitCall status --porcelain;
if ($GitChanges -ne ""){
    Write-Warning "Changes im Repository:";
    Write-Host $GitChanges;
    $Host.UI.WriteErrorLine( "Publish nicht möglich!" )
    exit 1
}

## Rückfrage mit Versions-Nummer
Write-Host ("Publish Version " + $FSVersion + "? Weiter mit [Enter] > ") -NoNewline
$key = [System.Console]::ReadKey().Key.ToString();
Write-Host
if ($key -ne "Enter"){
    $Host.UI.WriteErrorLine("Vorgang abgebrochen.")
    exit 1;
}

## fsdocs-Repository prüfen und aktualisieren
$TargetRepo = Join-Path -Path (Get-Item $PSScriptRoot).Parent.FullName -ChildPath "fsdocs"
if (!(Test-Path $TargetRepo)){
    GitCall clone "git@github.com:FrameworkSystemsGmbH/fsdocs.git", $TargetRepo
}
$GitRepoPath = $TargetRepo
GitCall reset --hard
GitCall clean "-fdx"
GitCall checkout master
GitCall pull


# Content-Repository bereinigen und auf den neusten Stand bringen.
$GitRepoPath = $PSScriptRoot;
GitCall push
GitCall clean "-fdxq"
GitCall pull

# FS-Repository für die Api-Doku prüfen
if (PrepareFsRepo("publish") -ne 0){
    $Host.UI.WriteErrorLine( "FS Repository not prepared!" )
    exit 1;
}

## Doku genereiren
& docfx\docfx.exe docfx.json

## in das ziel-Verzeichnis kopieren.
$GitRepoPath = $TargetRepo
$TargetRepoSite = Join-Path $TargetRepo ("v" + $FSVersion)

Write-Host "Rmove old site..."
Get-ChildItem -Path "$TargetRepoSite\*" -Recurse | Remove-Item -Force -Recurse
Remove-Item $TargetRepoSite -Force
if (Test-Path $TargetRepoSite){
    $Host.UI.WriteErrorLine( "Fehler beim Löschen des Zielverzeichnis " + $TargetRepoSite);
    exit 1;
}

Write-Host "copy new site..."
Copy-Item (Join-Path $PSScriptRoot "_site") -Destination $TargetRepoSite -Recurse -Force

## commit changes and push
GitCall commit "-a", "-q", "-m", ("Publish Version " + $FSVersion)
GitCall push

Write-Host
Write-Host
Write-Host "F E R T I G"
Write-Host
Write-Host