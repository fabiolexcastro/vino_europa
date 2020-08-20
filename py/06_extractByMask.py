
import arcpy, os
from arcpy import env
from arcpy.sa import *
arcpy.CheckOutExtension("Spatial")

os.system('cls')

CarpetaEntrada = raw_input("\nIndique carpeta de entrada")
ArchivoMascara = raw_input("\Entrar el archivo de mascara")
CarpetaSalida = raw_input("\Carpeta salida")

arcpy.env.workspace = CarpetaEntrada
rasters = arcpy.ListRasters("*","")

for raster in rasters:
	print raster
	arcpy.env.snapRaster = raster
	corte = CarpetaSalida + "\\" + raster
	
	outExtractByMask = ExtractByMask(raster, ArchivoMascara)
	outExtractByMask.save(corte)
	
print "Proceso terminado...!"