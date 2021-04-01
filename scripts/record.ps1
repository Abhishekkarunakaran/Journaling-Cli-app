#Script to write or edit the log files

$projectname = $args[0]
$date = Get-Date -Format "dd/MM/yyyy"
$filename = "${date}_log.md"

if ($null -eq $projectname) {
    Write-Warning "Enter the projectname"
    Write-Output "Use:`n ""jrnl record <projectname>"" to create or edit a log file"
    exit
}

if (Test-Path $projectname) {
    code $projectname/$filename
}
else {
    Write-Warning "${projectname} not found"
    Write-Output "Use:`n ""jrnl init <projectname>"" to initialize a project "
}
