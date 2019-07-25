function nikto {
    param(
        [switch] $Shell,
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.nikto"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, "/bin/sh", "-c", "/usr/local/nikto/nikto.pl ${Args}"
    }

    docker $docker_args
}

Export-ModuleMember -Function "nikto"