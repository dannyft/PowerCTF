
function spiderfoot {
    param(
        [switch] $Shell,
        [switch] $Server,
        [parameter(mandatory=$false, position=2, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.spiderfoot"

    $docker_args = "run", "--rm", "--net", "host", "-it", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/sh", $docker_image
    } elseif ($Server) {
        $docker_args += $docker_image, "python", "sf.py", $Args
    } else {
        $docker_args += $docker_image, "python", "sfcli.py", $Args
    }

    docker $docker_args
}

Export-ModuleMember -Function "spiderfoot"