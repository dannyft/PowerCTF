function kali {
    param (
        [string[]] $Ports = @(),
        [string] $Image = "",
        [switch] $List = $false,
        [string] $MetaPkg = "kali-top-10",
        [parameter(mandatory=$false, position=4, ValueFromRemainingArguments=$true)] [string[]] $args
    )

    if ("" -eq $Image) {
        $Image = GetConfig -key "image.kali" -default "kalilinux/kali-linux-docker"
    }

    if ($List) {
        kali "bash", "-c", "apt-cache show kali-linux-web | grep Depends"
    } elseif ($args.Length -gt 0) {
        $cwd = (Get-Item -Path ".\").FullName

        $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
        $docker_args += GetMountArgs

        foreach ($port in $Ports) {
            $docker_args += "-p", $port
        }

        $docker_args += $Image, $args

        docker $docker_args
    } else {
        OpenShell -Image $Image -Shell "/bin/bash" -Ports $Ports
    }
    
}

# function kali {
#     param(
#         [string] $Shell = "/bin/bash",
#         [string[]] $Ports = @()
#     )
#     $image = GetConfig -key "image.kali" -default "kali-top-10"
#     OpenShell -Image $image -Shell $Shell -Ports $Ports
# }

function kali_forensic {
    param(
        [string] $Shell = "/bin/bash",
        [string[]] $Ports = @()
    )
    $image = GetConfig -key "image.kali-forensic" -default "kali-forensic"
    OpenShell -Image $image -Shell $Shell -Ports $Ports
}

function kali_password {
    param(
        [string] $Shell = "/bin/bash",
        [string[]] $Ports = @()
    )
    $image = GetConfig -key "image.kali-password" -default "kali-password"
    OpenShell -Image $image -Shell $Shell -Ports $Ports
}

function kali_web {
    param(
        [string] $Shell = "/bin/bash",
        [string[]] $Ports = @()
    )
    $image = GetConfig -key "image.kali-web" -default "kali-web"
    OpenShell -Image $image -Shell $Shell -Ports $Ports
}

Export-ModuleMember -Function "kali", "kali_forensic", "kali_password", "kali_web"