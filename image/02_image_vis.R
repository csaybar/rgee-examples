library(rgee)
ee_Initialize()

image = ee$Image('LANDSAT/LC8_L1T_TOA/LC80440342014077LGN00')
vizParams = list(min=0, max=0.5, bands=c('B5', 'B4', 'B3'), gamma=c(0.95, 1.1, 1))

# Color palettes
image = ee$Image('LANDSAT/LC8_L1T_TOA/LC80440342014077LGN00')
ndwi = image$normalizedDifference(c('B3', 'B5'))
ndwiViz = list(min=0.5, max=1, palette=c('00FFFF', '0000FF'))

# Masking
ndwiMasked = ndwi$updateMask(ndwi$gte(0.4))

# Create visualization layers.
imageRGB = image$visualize(list(bands=c('B5', 'B4', 'B3'), max=0.5))
ndwiRGB = ndwiMasked$visualize(list(
  min=0.5,
  max=1,
  palette=c('00FFFF', '0000FF')
))

# Mosaic the visualization layers and display( or export).
roi = ee$Geometry$Point(c(-122.4481, 37.7599))$buffer(20000)


ee_map(image$clip(roi),
       center = c(-122.1899, 37.5010),
       zoom_start = 10,
       vizparams = vizParams,
       objname = 'Landsat 8') +
  ee_map(ndwiMasked$clip(roi),
         vizparams = ndwiViz,
         objname = 'NDWI')
