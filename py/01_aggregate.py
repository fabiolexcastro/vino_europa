
import arcpy
from arcpy import env
from arcpy.sa import *
env.workspace = "E:/asesorias/angie/raster/dem/raw/tif"

rasters = arcpy.ListRasters("", "")
print rasters

for raster in rasters:
	print(raster)
	outAggreg = Aggregate(raster, 4, "MEAN", "EXPAND", "DATA")
	outAggreg.save("E:/asesorias/angie/raster/dem/aggregate/tif/" + raster)

print "Done"