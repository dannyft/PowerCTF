function impacket {
    param(
        [switch] $Shell
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.impacket" -default "rflathers/impacket"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, $args
    }

    docker $docker_args
}

Export-ModuleMember -Function "impacket"