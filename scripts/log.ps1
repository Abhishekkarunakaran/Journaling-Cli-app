$projectname = $args[0]

if ($null -eq $projectname) {
    Write-Warning "Enter the project name"
    Write-Host "Use:`n ""jrnl init <projectname>"" to initialize project"
    exit
}

$files = Get-ChildItem $projectname

ForEach ($file in $files) {
    Write-Host "${projectname}/${file}"
    Write-Host "<!----------The Content is ---------->"
    Get-Content $projectname/$file
    Write-Host "<!----------end---------->"

}