.(".\functions.ps1")

if (PrepareFsRepo("build") -ne 0){
    $Host.UI.WriteErrorLine( "FS Repository not prepared!" )
    exit 1;
}

& docfx\docfx.exe docfx.json

& docfx\docfx.exe serve _site -p 1234