Write-Host "Obtener los xmls de Git"
Write-Host "Cuantos xmls hay?"
$rutaXML = $Env:BUILD_SOURCESDIRECTORY
Write-Host $rutaXML

$lista_xml = get-childitem -path $rutaXML  -filter "*.xml"

$numArchivos = 0

foreach ($row in $lista_xml)
{
	$xml = $rutaXML + $row
	 Write-Host "Leyendo Archivo - "  $numArchivos $xml
}
Write-Host "Fin del proceso"
