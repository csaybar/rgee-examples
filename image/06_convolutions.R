library(rgee)
ee_Initialize()

# Load and display an image.
image = ee$Image('LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140318')

# Define a boxcar or low-pass kernel.
# boxcar = ee$Kernel$square(list(
#   radius = 7, units = 'pixels', 'normalize' = T
# ))

boxcar = ee$Kernel$square(7, 'pixels', T)

# Smooth the image by convolving with the boxcar kernel.
smooth = image$convolve(boxcar)

# Define a Laplacian, or edge-detection kernel.
laplacian = ee$Kernel$laplacian8(1, F)

# Apply the edge-detection kernel.
edgy = image$convolve(laplacian)

ee_map(eeobject = image,
       vizparams = list(bands = c('B5', 'B4', 'B3'), max = 0.5),
       center = c(-121.9785, 37.8694),
       zoom_start = 11,
       objname = 'input image') + 
  ee_map(eeobject = smooth,
         vizparams = list(bands = c('B5', 'B4', 'B3'), max = 0.5),
         objname = 'smoothed') +
  ee_map(eeobject = edgy,
         vizparams = list(bands = c('B5', 'B4', 'B3'), max = 0.5),
         objname = 'edges')
