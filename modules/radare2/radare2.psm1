function r2 {
    param(
        [switch] $Shell,
        [string] $Cmd = "r2",
        [parameter(mandatory=$false, position=2, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.radare2"
    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs
    $docker_args += "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined"

    if ($Shell) {
        $docker_args += "--entrypoint=/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, $Cmd, $Args
    }

    docker $docker_args
}

function rax2 {
    r2 -Cmd "rax2"
}

function rafind2 {
    r2 -Cmd "rafind2"
}

function rarun2  {
    r2 -Cmd "rarun2"
}

function rabin2  {
    r2 -Cmd "rabin2"
}

function radiff2 {
    r2 -Cmd "radiff2"
}

function radiff2 {
    r2 -Cmd "radiff2"
}

function ragg2 {
    r2 -Cmd "ragg2"
}

function rahash2 {
    r2 -Cmd "rahash2"
}

Export-ModuleMember -Function "r2", "rax2", "rafind2", "rarun2", "rabin2", "radiff2", 
                              "rasm2", "ragg2", "ragg2", "rahash2"