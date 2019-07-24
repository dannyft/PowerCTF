function OpenShell {
    param(
        [string] $Image = "ubuntu:latest",
        [string] $Shell = "/bin/bash",
        [string[]] $Ports = @()
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $docker_args += GetMountArgs
    $docker_args += "--entrypoint=${Shell}"

    foreach ($port in $Ports) {
        $docker_args += "-p", $port
    }

    $docker_args += $Image

    docker $docker_args
}

function dbash {
    param(
        [string] $Image = "ubuntu:latest",
        [string[]] $Ports = @()
    )
    OpenShell -Shell "/bin/bash" -Image $Image -Ports $Ports
}

function dsh {
    param(
        [string] $Image = "ubuntu:latest",
        [string[]] $Ports = @()
    )
    OpenShell -Shell "/bin/sh" -Image $Image -Ports $Ports
}

<#
.DESCRIPTION
    REMnux reverse-engineering enviroment
#>
function remnux {
    param(
        [string] $Shell = "/bin/bash",
        [string[]] $Ports = @()
    )
    OpenShell -Image "remnux/thug" -Shell $Shell -Ports $Ports
}

Export-ModuleMember -Function "OpenShell", "dbash", "dsh", "kali", "remnux"