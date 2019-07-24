
function GetMountArgs {

    $args = @()
    
    $global_dir = "${PSScriptRoot}/files"
    if (Test-Path $global_dir) {
        $args += "-v", "${global_dir}:/files/global"
    }

    $user_dir = "${HOME}/.powerctf/files"
    if (Test-Path $$user_dir) {
        $args += "-v", "${user_dir}:/files/user"
    }

    return $args
}

function FindInConfig([string] $key, $config) {

    $path = $key.Split(".")
    $head = $path[0]
    $tail = $path[1..$path.Length]

    if ($config.$head) {
        if ($tail.Length -gt 0) {
            return FindInConfig -key ($tail -join '.') -default $default -config $config.$head
        } else {
            return $config.$head
        }
    }

    return $null

}

function GetConfig {
    param(
        [string] $key,
        $default = $null
    )

    $cwd = (Get-Item -Path ".\").FullName

    $config_path = "${cwd}/.powerctf/config.json"
    if (Test-Path $config_path) {
        $config = Get-Content -raw -path $config_path | ConvertFrom-Json -Verbose
        $result = FindInConfig -key $key -config $config -default $default
        if ($null -ne $result) {
            return $result
        }
    }

    $config_path = "${HOME}/.powerctf/config.json"
    if (Test-Path $config_path) {
        $config = Get-Content -raw -path $config_path | ConvertFrom-Json -Verbose
        $result = FindInConfig -key $key -config $config -default $default
        if ($null -ne $result) {
            return $result
        }
    }

    $config = Get-Content -raw -path "${PSScriptRoot}/config.json" | ConvertFrom-Json -Verbose
    $result = FindInConfig -key $key -config $config -default $default
    if ($null -ne $result) {
        return $result
    }

    return $default
}

Export-ModuleMember -Function "GetMountArgs", "GetConfig"