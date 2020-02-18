library(rgee)
ee_Initialize()

# Load a Landsat 8 image, select the panchromatic band$
image = ee$Image('LANDSAT/LC08/C01/T1/LC08_044034_20140318')$select('B8')

# Perform Canny edge detection and display the result$
canny = ee$Algorithms$CannyEdgeDetector(image, threshold = 10, sigma = 1)

# Perform Hough transform of the Canny result and display$
hough = ee$Algorithms$HoughTransform(canny, 256, 600, 100)

# Load a Landsat 8 image, select the panchromatic band$
image = ee$Image('LANDSAT/LC08/C01/T1/LC08_044034_20140318')$select('B8')

# Define a "fat" Gaussian kernel$
fat = ee$Kernel$gaussian(
  radius = 3,
  sigma = 3,
  units = 'pixels',
  normalize = T,
  magnitude = -1
)

# Define a "skinny" Gaussian kernel.
skinny = ee$Kernel$gaussian(
  radius = 3,
  sigma = 1,
  units = 'pixels',
  normalize = T
)

# Compute a difference-of-Gaussians (DOG) kernel.
dog = fat$add(skinny)

# Compute the zero crossings of the second derivative, display.
zeroXings = image$convolve(dog)$zeroCrossing()


ee_map(eeobject = canny,
       vizparams = list(min=0, max=1),
       center = c(-122.054, 37.7295),
       zoom_start = 10,
       objname = 'canny') + 
  ee_map(eeobject = hough,
         vizparams = list(min=0, max=1),
         objname = 'hough') +
  ee_map(eeobject = image,
         vizparams = list(min=0, max=12000),
         objname = 'L_B8') +
  ee_map(eeobject = zeroXings$updateMask(zeroXings),
         vizparams = list(palette = 'FF000'),
         objname = 'zero crossings')


