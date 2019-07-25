<#
.SYNOPSIS
    kali - Penetration Testing Distribution
.DESCRIPTION
    Execute a command or run a shell in Kali
.PARAMETER Port
    Add a list of port bindings to Kali. 
    "8080:80" will bind port 8080 to port 80 in the docker instance
.PARAMETER Args
    Command and arguments to Kali docker image
.LINK
    https://www.kali.org/
.EXAMPLE
    kali nmap -sV localhost
    This will execute nmap
.EXAMPLE
    kali
    If no arguments are provieded, it will spawn a bash shell
#>
function kali {
    param (
        [string[]] $Ports = @(),
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $docker_image = GetConfig -key "images.kali"

    if ($Args.Length -gt 0) {
        $cwd = (Get-Item -Path ".\").FullName

        $docker_args = "run", "--rm", "-it", "-v", "${cwd}:/project", "-w", "/project"
        $docker_args += GetMountArgs

        foreach ($port in $Ports) {
            $docker_args += "-p", $port
        }

        $docker_args += $docker_image, "/bin/bash", "-c", "${Args}"
        docker $docker_args
    } else {
        OpenShell -Image $docker_image -Shell "/bin/bash" -Ports $Ports
    }
    
}

<#
.SYNOPSIS
    nmap - Network exploration tool and security / port scanner
.DESCRIPTION
    Nmap (“Network Mapper”) is an open source tool for network exploration and
    security auditing. It was designed to rapidly scan large networks, although
    it works fine against single hosts. Nmap uses raw IP packets in novel ways
    to determine what hosts are available on the network, what services
    (application name and version) those hosts are offering, what operating
    systems (and OS versions) they are running, what type of packet
    filters/firewalls are in use, and dozens of other characteristics.
    While Nmap is commonly used for security audits, many systems and network
    administrators find it useful for routine tasks such as network inventory,
    managing service upgrade schedules, and monitoring host or service uptime.

    The output from Nmap is a list of scanned targets, with supplemental 
    information on each depending on the options used. Key among that 
    information is the “interesting ports table”. That table lists the port
    number and protocol, service name, and state. The state is either open,
    filtered, closed, or unfiltered.  Open means that an application on the
    target machine is listening for connections/packets on that port.
    Filtered means that a firewall, filter, or other network obstacle is
    blocking the port so that Nmap cannot tell whether it is open or closed.
    Closed ports have no application listening on them, though they could open
    up at any time. Ports are classified as unfiltered when they are responsive
    to Nmap's probes, but Nmap cannot determine whether they are open or closed.
    Nmap reports the state combinations open|filtered and closed|filtered when
    it cannot determine which of the two states describe a port. The port table
    may also include software version details when version detection has been
    requested. When an IP protocol scan is requested (-sO), Nmap provides
    information on supported IP protocols rather than listening ports.

    In addition to the interesting ports table, Nmap can provide further
    information on targets, including reverse DNS names, operating system
    guesses, device types, and MAC addresses.
.PARAMETER TemplateName
    Use a argument template defined in config.json under nmap.templates
.PARAMETER Args
    Nmap argument. See nmap -h for more information
.LINK
    https://nmap.org/
#>
function nmap {
    param (
        [string] $TemplateName,
        [parameter(mandatory=$false, position=2, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    if ("" -ne $TemplateName) {
        $auto_args = GetConfig -key "nmap.templates.${TemplateName}" -default @()
        $Args = $auto_args + $Args
    }

    kali "nmap" $Args
}

Export-ModuleMember -Function "kali", "nmap"