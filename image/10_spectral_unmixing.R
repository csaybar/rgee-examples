library(rgee)
ee_Initialize()

# Load a Landsat 5 image and select the bands we want to unmix.
bands = c('B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7')

image = ee$Image('LANDSAT/LT05/C01/T1/LT05_044034_20080214')$select(bands)
ee_map(eeobject = image,
       vizparams = list(min=0, max=128, bands=c('B4', 'B3', 'B2')),
       center = c(-122.1899, 37.5010), # San Francisco Bay
       zoom_start = 10,
       objname = 'image')

# Define spectral endmembers.
urban = c(88, 42, 48, 38, 86, 115, 59)
veg = c(50, 21, 20, 35, 50, 110, 23)
water = c(51, 20, 14, 9, 7, 116, 4)

# Unmix the image.
fractions = image$unmix(list(urban, veg, water))
Map.addLayer(fractions, {}, 'unmixed')

ee_map(eeobject = fractions,
       vizparams = list(min=0, max=2),
       center = c(-122.1899, 37.5010), # San Francisco Bay
       zoom_start = 10,
       objname = 'unmixed')
