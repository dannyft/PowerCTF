function gobuster {

    param(
        [switch] $Shell = $false
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.gobuster" -default "gobuster:latest"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/sh", $docker_image
    } else {
        $docker_args += $docker_image, $args
    }

    docker $docker_args 
}
