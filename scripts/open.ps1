#Script to open or edit a specific file in the project directory

$projectname = $args[0]
$filename = $args[1]
$flag = $args[2]

$use = "Use :`n ""open <projectname> <filename> <flag>"" `n flags : `n ""-e"" to edit the file `n ""-s"" to show the content of the file"
$valid = "Not valid format"

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
                Write-Host "<!----------End---------->"
            }
            Default {
                Write-Warning $valid
                Write-Host $use
            }
        }    
    }
    else {
        Set-Location ../
        Write-Warning $valid
        Write-Host $use
        exit
    }
    Set-Location ../
}
else {
    Set-Location ../
    Write-Warning $valid
    Write-Host $use
    exit
}
