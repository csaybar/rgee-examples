library(rgee)
ee_Initialize()

# Load a Landsat 8 image.
image = ee$Image('LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140318')

# Create NDVI and NDWI spectral indices.
ndvi = image$normalizedDifference(c('B5', 'B4'))
ndwi = image$normalizedDifference(c('B3', 'B5'))

# Create a binary layer using logical operations.
bare = ndvi$lt(0.2)$And(ndwi$lt(0))

# Mask and display the binary layer.
ee_map(center = c(-122.3578, 37.7726),
       zoom_start = 12,
       bare$updateMask(bare),
       zoom = 3,
       objname = 'bare')
