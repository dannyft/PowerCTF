function wfuzz {
    param(
        [switch] $Shell
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.wfuzz"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/sh", $docker_image
    } else {
        $docker_args += $docker_image, "wfuzz", $args
    }

    docker $docker_args

}

Export-ModuleMember -Function "wfuzz"