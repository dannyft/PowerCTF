function empire {

    param(
        [switch] $Shell = $false,
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)] [string[]] $Args
    )

    $cwd = (Get-Item -Path ".\").FullName

    $docker_image = GetConfig -key "images.empire"
    $docker_args = "run", "--rm", "-it", "--net", "host", "-v", "${cwd}:/project"
    $docker_args += GetMountArgs

    if ($Shell) {
        $docker_args += "--entrypoint", "/bin/bash", $docker_image
    } else {
        $docker_args += $docker_image, "empire", $Args
    }

    docker $docker_args
}

Export-ModuleMember -Function "empire"