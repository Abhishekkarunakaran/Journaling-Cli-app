$projectname = $args[0]
$filename = $args[1]
$flag = $args[2]

$use = "Use :`n ""open <projectname> <filename> <flag>"" `n flags : `n ""-e"" to edit the file `n ""-s"" to show the content of the file"

# if ($null -eq $projectname) {
#     Write-Warning "Enter a valid project name"
#     Write-Host $use
#     #exit
# }
# elseif ($null -eq $filename) {
#     Write-Warning "Enter a valid file name"
#     Write-Host $use
#     #exit
# }
# elseif ($null -eq $flag) {
#     Write-Warning "Enter a valid flag"
#     Write-Host $use
#     #exit
# }

if (($null -ne $projectname) -and (Test-Path $projectname)) {
    # $files = Get-ChildItem $projectname
    Set-Location $projectname
    if (($null -ne $filename) -and (Test-Path $filename)) {
        switch ($flag) {
            ("-e") { 
                code $filename
            }
            ("-s") {
                Write-Host "<!----------${filename}---------->"
                Get-Content $filename
                Write-Host "<!----------"
            }
            Default {
                Write-Warning "Enter a valid flag"
                Write-Host $use
            }
        }    
    }
    else {
        Set-Location ../
        Write-Warning "Enter a valid file name"
        Write-Host $use
        exit
    }
    Set-Location ../
}
else {
    Set-Location ../
    Write-Warning "Enter a valid project name"
    Write-Host $use
    exit
}
