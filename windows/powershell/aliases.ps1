# Quick Navigation
function pdf { Set-Location "C:\Repos\Github" }
Set-Alias pd pdf

function ppdf { Set-Location "C:\Code" }
Set-Alias ppd ppdf

function udf{ Set-Location "C:\Users\NMiller" }
Set-Alias ud udf

function ncf { Set-Location "C:\Users\NMiller\AppData\Local\nvim\" }
Set-Alias nc ncf

# Tools
Set-Alias grep rg
Set-Alias vim nvim
Set-Alias tldr "C:\Users\NMiller\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\LocalCache\local-packages\Python313\Scripts\tldr.exe"

# Dotnet Run and Project Specific
function dnrf { dotnet run }
Set-Alias dr dnrf

## Merchant
function merchantTestClientFunc { dotnet run --project "C:\Repos\Github\Merchant\Merchant.TestClient" }
Set-Alias mtc merchantTestClientFunc
function merchantApiRunFunc { dotnet run --project "C:\Repos\Github\Merchant\Merchant.API" }
Set-Alias mr merchantApiRunFunc

## Symposia
function symposiaTestClientFunc { dotnet run --project "C:\Repos\Github\Symposia\Symposia.TestClient.NetCore\" }
Set-Alias stc symposiaTestClientFunc
function symposiaApiRunFunc { dotnet run --project "C:\Repos\Github\Symposia\Symposia.API" }
Set-Alias sr symposiaApiRunFunc

## EWR
function ewrRunFunc { dotnet run --project "C:\Repos\Github\EventWebRegistration\EventWebRegistrationPublic\" }
Set-Alias ewr ewrRunFunc

## CABStaff
function cabRunFunc { dotnet run --project "C:\Repos\Github\CabStaffV2\CabStaff" }
Set-Alias cabr cabRunFunc
