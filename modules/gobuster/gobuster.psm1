function gobuster {

    param(
        [switch] $Shell = $false,
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.gobuster"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/sh", $docker_image
    } else {
        $docker_args += $docker_image, $Args
    }

    docker $docker_args 
}
