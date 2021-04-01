#Script to initialize a project 

$projectname = $args[0]
$date = Get-Date -Format "dd/MM/yyyy"
$filename = "${date}_log.md"

if (($null -eq $projectname) -or ($projectname -eq "")) {
    Write-Warning "Enter the name of the project`n"

    Write-Host "Use:`n ""jrnl init <projectname>"" to initialize a project"
    exit
}

if (Test-Path $projectname) {
    Write-Warning "${projectname} already existing...`n`n"
    Write-Output "Use: `n ""jrnl show <projectname>"" to view the content of the file`n"
    exit
}
else {
    mkdir $projectname > $null
    code $projectname/$filename
}