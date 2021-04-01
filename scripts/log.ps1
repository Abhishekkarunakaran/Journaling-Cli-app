$projectname = $args[0]

$files = Get-ChildItem $projectname

ForEach ($file in $files) {
    Write-Host "${projectname}/${file}"
    Write-Host "<!----------The Content is ---------->"
    Get-Content $projectname/$file
    Write-Host "<!----------end---------->"

}