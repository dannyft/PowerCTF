
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
 

Export-ModuleMember -Function "GetMountArgs"