$PYTHON_ENV_DIR = ".powerctf/pwntools"

<#
.SYNOPSIS
    Pwntools
.DESCRIPTION
    Execute pwntools script
.PARAMETER script
    Script to execute. If no script is provrided, it will run pwntools in ipython.
.LINK
    http://docs.pwntools.com/en/stable/
#>
function pwntools {

    param(
        [string] $script = ""
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.pwntools"
    $args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
    $args += GetMountArgs
    $args += "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined"

    $args += $docker_image

    $internal_args = @()
    if ($script -ne "") {
        if (Test-Path $script) {
            $internal_args += $script
        } else {
            Write-Error "File '${script}' not found"
        }
    } else {
        $internal_args = "ipython", "-i", "--no-banner", "-c", "'from pwn import *'"
    }

    if (Test-Path "${cwd}/${PYTHON_ENV_DIR}") {
        $internal_args = "bash", "-c", "source ${PYTHON_ENV_DIR}/bin/activate && $internal_args"
    }

    docker ($args + $internal_args)
}

<#
.SYNOPSIS
    Virtualenv Pwntools
.DESCRIPTION
    Crontroll virtualenv in pwntools
#>
function pwntools_env {

    param(
        [switch] $Create = $false,
        [string[]] $Install = @(),
        [string[]] $Uninstall = @()
    )

    $cwd = (Get-Item -Path ".\").FullName
    $docker_image = GetConfig -key "images.pwntools"
    $args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project", $docker_image
    $args += GetMountArgs
    $args += "--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined"

    if ($Create) {
        $args_create = $args + "virtualenv", "--system-site-packages", $PYTHON_ENV_DIR
        docker $args_create 
    }

    if ($Install.Count -gt 0) {
        if (Test-Path "${cwd}/${PYTHON_ENV_DIR}") {
            $args += "bash", "-c", "source ${PYTHON_ENV_DIR}/bin/activate && pip install ${Install}"
            docker $args
        } else {
            Write-Error "No pwntools env created"
        }
    }

    if ($Uninstall.Count -gt 0) {
        if (Test-Path "${cwd}/${PYTHON_ENV_DIR}") {
            $args += "bash", "-c", "source ${PYTHON_ENV_DIR}/bin/activate && pip uninstall ${Uninstall}"
            docker $args
        } else {
            Write-Error "No pwntools env created"
        }
    }

}

Export-ModuleMember -Function "pwntools", "pwntools_env"