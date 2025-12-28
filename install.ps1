# Check for parameters
param (
    [switch]$Force,
    [string]$Directory
)

# display help
function Show-Usage {
    Write-Host "Usage: $($MyInvocation.MyCommand) [-f | --force] [directory]"
    Write-Host "  -f | --force      If target file exists, delete it and do not backup."
    Write-Host "  directory         Only link the specified directory."
    exit 1
}

# link directory
function Link-Directory {
    param (
        [string]$Dir,
        [bool]$Force
    )
    
    $File = Join-Path -Path $ScriptPath -ChildPath $Dir
    $FileName = Split-Path -Path $File -Leaf

    # Check if the item is a symbolic link
    if (Test-Path "$ConfigHome\$FileName") {
        $item = Get-Item "$ConfigHome\$FileName"
        if ($item.PSIsContainer -eq $false -and $item.LinkType -eq "SymbolicLink") {
            Remove-Item "$ConfigHome\$FileName"
        } elseif ($Force) {
            Remove-Item "$ConfigHome\$FileName" -Recurse -Force
            Write-Host "Deleted: $ConfigHome\$FileName"
        } else {
            Move-Item "$ConfigHome\$FileName" "$ConfigHome\$FileName.bak"
            Write-Host "Backup: $ConfigHome\$FileName.bak"
        }
    }

    New-Item -ItemType SymbolicLink -Path "$ConfigHome\$FileName" -Target $File
}

# get current script path
$ProjectPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$ScriptPath = Join-Path -Path $ProjectPath -ChildPath "config"

# if exists XDG_CONFIG_HOME then use it, else use ~/.config
$ConfigHome = $env:XDG_CONFIG_HOME
if (-not $ConfigHome) {
    $ConfigHome = Join-Path -Path $HOME -ChildPath ".config"
}

# create config home if not exists
if (-not (Test-Path $ConfigHome)) {
    New-Item -ItemType Directory -Path $ConfigHome
}

# flags
$SingleDir = ""

# Check if the script is called with parameters
if ($Directory) {
    if (Test-Path (Join-Path -Path $ScriptPath -ChildPath $Directory)) {
        $SingleDir = $Directory
    } else {
        Write-Host "Error: Directory does not exist: $Directory"
        exit 1
    }
}

# if not specifying a dir, ask for each
if (-not $SingleDir) {
    Get-ChildItem -Path $ScriptPath -Directory | ForEach-Object {
        $D = $_.FullName
        Write-Host "Link: $D -> $ConfigHome\$($_.Name)"
        $Reply = Read-Host "Do you want to continue? [Y/n]"
        if ($Reply -eq 'N' -or $Reply -eq 'n') {
            return
        }
        Link-Directory -Dir $_.Name -Force $Force
    }
} else {
    Link-Directory -Dir $SingleDir -Force $Force
}

Write-Host "Done."
