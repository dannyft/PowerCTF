Import-Module "${PSScriptRoot}/core.psm1" -Force

function LoadModules {
    $modules = GetConfig -key "modules" -default @()
    foreach ($module in $modules) {
        if ($module[0] -eq '@') {
            $file = $module[1..$module.Length] -join ''
            Import-Module "${PSScriptRoot}/modules/$file" -Force
        } elseif ($module[0] -eq '.') {
            $cwd = (Get-Item -Path ".\").FullName
            $file = $module[1..$module.Length] -join ''
            Import-Module "${cwd}/.powerctf/modules/$file" -Force
        } elseif ($module[0] -eq '~') {
            $file = $module[1..$module.Length] -join ''
            Import-Module "${HOME}/.powerctf/modules/$file" -Force
        } else {
            Import-Module $module[0] -Force
        }
    }
}

LoadModules