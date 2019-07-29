function gef {
    param(
        [switch] $Shell = $false,
        [string[]] $Ports = @(),
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.gef"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs
    $docker_args += "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined"

    foreach ($port in $Ports) {
        $docker_args += "-p", $port
    }

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, "gdb", $Args
    }

    docker $docker_args
}

Export-ModuleMember -Function "gef"