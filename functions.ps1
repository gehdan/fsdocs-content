function GitCall {
    param (
        [Parameter(Mandatory=$true)][string]$verb,
        [string[]]$arguments
    )

    ## keine Rückfrage bei git clean
    $env:GIT_ASK_YESNO = "false"

    $argumentList = New-Object System.Collections.Generic.List[String];
    $argumentList.Add($verb)  | Out-Null;
    foreach($arg in $arguments){
        if ($arg.IndexOf(' ') -gt 0){
            $argumentList.Add("""" + $arg + """") | Out-Null;
        } else {
            $argumentList.Add($arg) | Out-Null;
        }
    }

    $pinfo = New-Object System.Diagnostics.ProcessStartInfo;
    if (Test-Path $GitRepoPath){
        $pInfo.WorkingDirectory = $GitRepoPath;
    }
    $pinfo.FileName = "git.exe";
    $pinfo.Arguments = [System.String]::Join(" ", $argumentList);
    $pinfo.RedirectStandardOutput = $true;
    $pinfo.UseShellExecute = $false;
    
    Write-Host ($GitRepoPath + " > git " + $pinfo.Arguments);
    
    $p = New-Object System.Diagnostics.Process;
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $p.WaitForExit()
    $output = $p.StandardOutput.ReadToEnd()

    if ($p.ExitCode -ne 0){
        $Host.UI.WriteErrorLine( "Fehler in git.exe - ExitCode = " + $p.ExitCode + " | git " + $pinfo.Arguments )
        exit 1;
    }

    return $output.Trim();
}

function PrepareFsRepo {
    ## cloned das FS-Repository in den Ordner fsdocs-fs und sorgt dafür, dass der richtige Branch ausgescheckt ist.
    ##
    ##  Vriante 1: build / preview
    ##      - RÜckfrage bei abweichender Branch-Version
    ##      - Feature-Branches sind okay

    ##  Vrainte 2: publish
    ##      - der dev-Branch (x.y/dev) ist zwinged vorgeschrieben
    ##      - es darf keine offenen Änderungen geben

    param(
        # mögliche Werte
        # * build (default)
        # * publish
        [string]$mode="build"
    )

    $isPublish = ($mode -eq "publish")

    $FSRepoDir = "fsdocs-fs";
    $FSRepoPath = Join-Path -Path (Get-Item $PSScriptRoot).Parent.FullName -ChildPath $FSRepoDir

    if ($isPublish){
        Write-Host "Prepare repository for Publish";
    } else {
        Write-Host "Prepare repository for Build, Preview";
    }

    ### Den Namen des aktuellen Branches ermitteln.
    ### Das passiert hiert, weil der Repo-Path im Anschluss auf das FS-Repo gestellt wird.
    $GitRepoPath = $PSScriptRoot;
    $FSDocsBranch = GitCall rev-parse --abbrev-ref, HEAD
    $FSVersion = $FSDocsBranch.SubString(0, $FSDocsBranch.IndexOf('/'));

    ### Das FS-Repsitory anlegen, wenn es nicht existiert
    $GitRepoPath = $FSRepoPath;
    if (!(Test-Path $FSRepoPath)){
        Write-Host "Das Repository " $FSRepoDir " existiert nicht. Frisch klonen?"
        Write-Host "   [J] Ja, [N] Nein (default) > "  -NoNewline;
        if (!([System.Console]::ReadKey().Key.ToString() -eq "J")){
            Write-Host;
            Write-Warning " - Vorgang abgebrochen!";
            Write-Host;
            if ($isPublish) { return 1; } else { return 0; }
        }
        Write-Host;

        $_ = GitCall clone "U:\FrameworkStudio\git\FS", $FSRepoPath
    }

    ## in den richtigen dev-Branch wechseln.
    $FSDevBranch = $FSVersion + "/dev";

    $FSCurrentDevBranch = GitCall rev-parse --abbrev-ref, HEAD;
    if ($FSCurrentDevBranch.IndexOf('/') -eq -1){
        $FSCurrentDevBranchVersion = "0.0"
    } else {
        $FSCurrentDevBranchVersion = $FSCurrentDevBranch.SubString(0, $FSCurrentDevBranch.IndexOf('/'));
    }
    $GitChanges = GitCall status --porcelain;

    if ($GitChanges -ne ""){
        Write-Warning "Changes im Repository:";
        Write-Host $GitChanges;

        if ($isPublish){
            $Host.UI.WriteErrorLine("Publish nicht möglich.")
            return 1
        } else {
            if ($FSCurrentDevBranchVersion -eq $FSVersion){
                ## wenn die Version stimmt, dann ist alles okay
            } elseif ($FSCurrentDevBranch -ne $FSDevBranch){
                Write-Host "Aktuell ist der Branch " $FSCurrentDevBranch " ausgecheckt. Checkout von " $FSDevBranch " nicht möglich. Trotzdem fortfahren?"
                Write-Host "  [J] Ja (default), [N] Nein >" -NoNewline
                $key = [System.Console]::ReadKey().Key.ToString();
                Write-Host
                if ($key -ne "J"){
                    $Host.UI.WriteErrorLine("Vorgang abgebrochen.")
                    return 1
                }
                Write-Warning "Der build erfolgt mit einem abweichenden FS-Branch."
            }
        }
    } else {
        if ($isPublish){
            $_ = GitCall checkout $FSDevBranch
            $_ = GitCall pull
        } else {
            if ($FSDevBranch -ne $FSCurrentDevBranch){
                Write-Host "Aktuell ist der Branch " $FSCurrentDevBranch " ausgecheckt. Soll in den Branch " $FSDevBranch " gewechselt werden?"
                Write-Host "   [J] Ja, [N] Nein (default), [Andere Taste] Cancel > " -NoNewline
                $key = [System.Console]::ReadKey().Key.ToString();
                Write-Host
                if ($key -eq "J"){
                    $_ = GitCall checkout $FSDevBranch;
                    $_ = GitCall pull;
                } elseif ($key -eq "N" -or $key -eq "Enter"){
                    Write-Warning "Der Build erfolgt mit einem abweichenden FS-Branch."
                    # nichts machen
                } else {
                    $Host.UI.WriteErrorLine("Vorgang abgebrochen.")
                    return 1
                }
            }
        }
    }

    ## beim Publish muss das FS-Repo noch bereinigt werden damit keine ungewollten Inhalte vorhanden sind.
    if ($isPublish){
        $_ = GitCall clean "-fdx"
    }

    ## eine dummy GlobalAssembly anlegen, damit es beim Build keine Warning gibt.
    $GlobalAssemblyInfoPath = Join-Path $FSRepoPath "FS\GlobalAssemblyInfo.cs";
    if (!(Test-Path $GlobalAssemblyInfoPath)){
        Write-Host "Dummy GlobalAssemblyInfo schreiben.."
        "// dummy file for docfx generation" | Out-File $GlobalAssemblyInfoPath;
    }

    return 0
}