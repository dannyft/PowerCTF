function kali {
    param (
        [string[]] $Ports = @(),
        [string] $Image = "",
        [string] $MetaPkg = "kali-top-10",
        [parameter(mandatory=$false, ValueFromRemainingArguments=$true)] [string[]] $args
    )

    if ("" -eq $Image) {
        $Image = GetConfig -key "image.kali"
    }

    if ($args.Length -gt 0) {
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

Export-ModuleMember -Function "kali", "kali_forensic", "kali_password", "kali_web"