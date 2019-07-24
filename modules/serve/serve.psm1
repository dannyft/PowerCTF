<#
.SYNOPSIS
    Serve current dir with a http/https server
.DESCRIPTION
    Share the current dir over http and https.
    There will be generated a selfsigned SSL cert every time
    a new server is started.
#>
function serve_http {
    param(
        [int] $HttpPort = 80,
        [int] $HttpsPort = 443
    )

    $cwd = (Get-Item -Path ".\").FullName
    $docker_image = GetConfig -key "images.nginx" -default "rflathers/nginxserve"
    $args = "run", "--rm", "-it",
            "-p", "${HttpPort}:80",
            "-p", "${HttpsPort}:443",
            "-v", "${cwd}:/srv/data",
            $docker_image
    docker $args
}

<#
.SYNOPSIS
    Share current dir with SMB
#>
function serve_smb {
    param(
        [string] $ShareName = "SHARE",
        [int] $Port = 445
    )

    $cwd = (Get-Item -Path ".\").FullName
    $docker_image = GetConfig -key "images.impacket" -default "rflathers/impacket"
    $args = "run", "--rm", "-it",
            "-p", "${Port}:445",
            "-v", "${cwd}:/tmp/serve",
            $docker_image,
            "smbserver.py", "-smb2support", $ShareName, "/tmp/serve"
    docker $args
}

<#
.SYNOPSIS
    Share current dir with webdav
#>
function serve_webdav {
    param(
        [int] $Port = 80
    )

    $cwd = (Get-Item -Path ".\").FullName
    $docker_image = GetConfig -key "images.webdav" -default "rflathers/webdav"
    $args = "run", "--rm", "-it",
            "-p", "${Port}:80",
            "-v", "${cwd}:/srv/data/share",
            $docker_image
    docker $args
}

Export-ModuleMember -Function "serve_http", "serve_smb", "serve_webdav"