#Script to show the content

$projectname = $args[0]

if ($null -eq $projectname) {
    Write-Warning "Enter the project name"
    Write-Host "Use:`n ""jrnl show <projectname>"" to show the files in the project directory"
    exit
}
if (Test-Path $projectname) {
    Get-ChildItem $projectname
}
else {
    Write-Warning "${projectname} not initialized"  
    Write-Host "Use:`n ""jrnl init <projectname>"" to initialize a project"
}