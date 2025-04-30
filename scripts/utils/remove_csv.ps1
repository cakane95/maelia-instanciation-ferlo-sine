# remove_csv.ps1
# Supprime tous les fichiers .csv dans diohine/modeleCommun/meteo/simulee/

$targetFolder = "..\..\diohine\modeleCommun\meteo\simulee"

if (Test-Path $targetFolder) {
    Get-ChildItem -Path $targetFolder -Filter *.csv | Remove-Item -Force
    Write-Host "Tous les fichiers .csv ont été supprimés de $targetFolder"
} else {
    Write-Host "Le dossier $targetFolder n'existe pas."
}
