
function osmedeus {
    param(
        [switch] $Shell,
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.osmedeus"

    $docker_args = "run", "--rm", "--net", "host", "-it", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs
    $docker_args += "-v", "${cwd}/.powerctf/osmedeus:/home/Osmedeus/workspaces"

    $_ = New-Item -ItemType Directory -Force -Path "${cwd}/.powerctf/osmedeus"

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, $Args
    }

    docker $docker_args
}

Export-ModuleMember -Function "osmedeus"