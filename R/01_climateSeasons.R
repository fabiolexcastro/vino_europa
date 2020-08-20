

# Load libraries ----------------------------------------------------------
require(pacman)
pacman::p_load(raster, rgdal, rgeos, stringr, sf, tidyverse, gtools)

g <- gc(reset = TRUE)
rm(list = ls())
options(scipen = 999)

# Functions to use --------------------------------------------------------
calc_season <- function(vr, sn, fn){
  
  # vr <- 'tmax'
  # sn <- 6:8
  # fn <- 'max'
  
  print('To start')
  fl <- grep(vr, fls, value = T)
  fl <- mixedsort(fl)
  
  sn <- ifelse(sn < 10, paste0('0', sn), sn)
  sn <- paste0(sn, '.tiff.tif$', collapse = '|')
  
  fl <- grep(sn, fl, value = T)
  st <- stack(fl)
  tb <- rasterToPoints(st)
  tb <- as.data.frame(tb)
  nm <- colnames(tb)
  
  print('Calculating the function')
  rs <- apply(tb[,3:5], 1, FUN = fn)
  rs <- cbind(tb[,c(1, 2)], result = rs)
  rs <- rasterFromXYZ(rs)
  
  print('Done!')
  return(rs)
  
}

# Load data ---------------------------------------------------------------
fls <- list.files('../raster/climate/baseline_cut', full.names = T, pattern = '.tif$')
vrs <- c('prec', 'tmax', 'tmean', 'tmin')

# Seasons -----------------------------------------------------------------

# Summer tmax
rs <- calc_season(vr = 'tmax', sn = 6:8, fn = 'max')
writeRaster(rs, '../raster/climate/baseline_cut/seasons/summer_tmax.tif')
# Summer tmean
rs <- calc_season(vr = 'tmean', sn = 6:8, fn = 'mean')
writeRaster(rs, '../raster/climate/baseline_cut/seasons/summer_tmax.tif')



# Summer
mnt <- 6:8
fle <- grep('tmax', fls, value = TRUE)
fle <- mixedsort(fle)
mnt <- ifelse(mnt < 10, paste0('0', mnt), mnt)
mnt <- paste0(mnt, '.tiff', collapse = '|')
fle <- grep(mnt, fle, value = TRUE)
stk <- stack(fle)
stk <- list.files('../raster/climate/baseline/seasons', full.names = T, pattern = '.tif$')
stk <- stack(stk)
max <- calc(stk, raster::which.max)



# Summer
6:8
# Invierno # Winter
12:2
# Otono Autumn
9:11
# Primavera Spring
3:5