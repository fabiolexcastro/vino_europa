
import arcpy
from arcpy import env
from arcpy.sa import *

env.workspace = "E:/asesorias/angie/raster/dem/aggregate/tif"
rasters = arcpy.ListRasters("", "")
print rasters

arcpy.CheckOutExtension("Spatial")

for raster in rasters:
	print(raster)
	outFill = Fill(raster)
	outFill.save("E:/asesorias/angie/raster/dem/fill/" + raster)

print "Done"