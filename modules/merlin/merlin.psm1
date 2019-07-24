function merlin {

    param(
        [switch] $Shell = $false,
        [int] $Port = 443
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.merlin" -default "merlin:latest"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project",
                   "-p", "${$Port}:443"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash"
    }

    $docker_args += $docker_image

    docker $docker_args
}

Export-ModuleMember -Function "merlin"