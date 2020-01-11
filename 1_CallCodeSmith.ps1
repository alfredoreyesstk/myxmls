Write-Host "Inicia Proceso - 1_CallCodeSmith"

$plantilla = "c:\tmp\powerscripts\plantilla\MasterProj.csp"
$dirSalida = "c:\tmp\powerscripts\CodigoGenerado\"
$dirSalidaDA = $dirSalida + "WADataAccess\"
$dirSalidaModel = $dirSalida + "WAModel\"
$dirSalidaServices = $dirSalida + "WAServices\"
$dirSalidaSQL = $dirSalida + "WADatabase\"

if (-not (Test-Path -Path  $dirSalida)) {
    #mkdir $rutaCodigoGenerado 
    mkdir $dirSalidaDA
    mkdir $dirSalidaModel
    mkdir $dirSalidaServices
    mkdir $dirSalidaSQL
}

#$wsSalida ="CRUD"

$rutaXML = "c:\tmp\powerscripts\xmls\"
$lista_xml = get-childitem -path $rutaXML  -filter "*.xml"

$numArchivos = 0

foreach ($row in $lista_xml)
{
    $xml = $rutaXML + $row
    $numArchivos = $numArchivos + 1
   Write-Host "Leyendo Archivo - "  $numArchivos $xml
  
   $comando =  $plantilla + " /p:XMLEntidad=" + $xml + " /p:BaseOutputDirectory=" + $dirSalida + " /p:XMLFolder=" + $rutaXML + 
                " /p:DataAccessOutputDirectory=" + $dirSalidaDA + " /p:ModelOutputDirectory=" + $dirSalidaModel +
                " /p:ServicesOutputDirectory=" + $dirSalidaServices + " /p:SQLOutputDirectory=" + $dirSalidaSQL +
                " /nologo" 
               
  #Write-Host $comando 
   start cs $comando 

if ($error.count -gt 0)
{
    Write-Host "Error" + $Error
    #.\Reporta.ps1 -rutaversion $rutaVersion  -aplicacion $aplicacion -funcion "Code Smith" -parametros  $comando -mensaje  $Error -estado "ERROR"
}
else{
    #Write-Host "NO error"
    #.\Reporta.ps1 -rutaversion $rutaVersion  -aplicacion $aplicacion -funcion "Code Smith" -parametros  $comando -mensaje  "" -estado "OK"  
}
$Error.Clear()


   Write-Host "Espera 6 segundos"
   sleep 6

   #VAR 3.- ARCHIVO XML 
#$xml = $rutaXML + $row
#Write-Host "5.1.- Procesando archivo xml en:" $xml
#Write-Host "INICIA GENERACION DE CODIGO DE"  $xml
#$comando =  $plantilla + " /p:XMLEntidad=" + $xml + " /p:DirectorioBase=" + $dirSalida + " /p:ServiceName=" + $wsSalida +" /nologo"
#Write-Host "5.2.- Ejecutando CodeSmith: " $comando
#$Error.Clear
#start cs $comando
#if ($error.count -gt 0)
#{
#  .\Reporta.ps1 -rutaversion $rutaVersion  -aplicacion $aplicacion -funcion "Code Smith" -parametros  $comando -mensaje  $Error -estado "ERROR"
#}
#else{
#    .\Reporta.ps1 -rutaversion $rutaVersion  -aplicacion $aplicacion -funcion "Code Smith" -parametros  $comando -mensaje  "" -estado "OK"  
#}
#$Error.Clear()

#Write-Host "5.3.- Espera 8 segundos"
#sleep 8

}
