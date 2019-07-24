Import-Module "${PSScriptRoot}/../core.psm1" -Force

$MSF4_DIR = "${HOME}/.powerctf/msf4"

# /usr/src/metasploit-framework

function metasploit {

    $cwd = (Get-Item -Path ".\").FullName

    $docker_args = "run", "--rm", "-it", "--net", "host", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs

    if (Test-Path $MSF4_DIR) {
        $docker_args += "-v", "${MSF4_DIR}:/home/msf/.msf4"
    }

    $docker_args += "metasploitframework/metasploit-framework", "./msfconsole", $args

    docker $docker_args
}

function msfvenom {

    $cwd = (Get-Item -Path ".\").FullName

    $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs

    if (Test-Path $MSF4_DIR) {
        $docker_args += "-v", "${MSF4_DIR}:/home/msf/.msf4"
    }

    $docker_args += "metasploitframework/metasploit-framework", "./msfvenom", $args

    docker $docker_args
}

Export-ModuleMember -Function "metasploit", "msfvenom"