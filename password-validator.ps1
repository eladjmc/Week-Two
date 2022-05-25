#!/usr/bin/env pwsh
#Some consts to make the code more readable.
Set-Variable -Name NO_PASSWORD_LENGTH -Value 0 -Option Constant
Set-Variable -Name MIN_PASSWORD_LENGTH -Value 10 -Option Constant
Set-Variable -Name ERROR -Value 1 -Option Constant
Set-Variable -Name NO_ERROR -Value 0 -Option Constant

$password=$args[0]

if($password -eq '-f'){
    if(-not $args[1]){
        Write-Host -BackgroundColor Black -ForegroundColor Red "No path to file was inputed"
        return $ERROR
    }
    $path=$args[1]
    $password=Get-Content $path
}

if($password.Length -eq $NO_PASSWORD_LENGTH){
     Write-Host -BackgroundColor Black -ForegroundColor Red "No password was added!"
     return $ERROR
}

if($password.Length -le $MIN_PASSWORD_LENGTH){
     Write-Host -BackgroundColor Black -ForegroundColor Red "Password is too short!"
     return $ERROR
}

    If ( -not (($password -match "[0-9]") -and ($password -cmatch "[A-Z]") -and ($password -cmatch "[a-z]")) ){
        Write-Host -BackgroundColor Black -ForegroundColor Red "Password does not contain a mix of digits, lowercase and upper case letters!"
        return $ERROR
    }

Write-Host -BackgroundColor Black -ForegroundColor Green "Password is VALID!"
return $NO_ERROR
