library(rgee)
ee_Initialize()

# Load a high-resolution NAIP image.
image = ee$Image('USDA/NAIP/DOQQ/m_3712213_sw_10_1_20140613')

# Zoom to San Francisco, display.
ee_map(eeobject = image,
       vizparams = list(min=0, max=255),
       center = c(-122.466123, 37.769833), # San Francisco Bay
       zoom_start = 17,
       objname = 'image')

# Get the NIR band.
nir = image$select('N')

# Define a neighborhood with a kernel.
square = ee$Kernel$square(radius=4)

# Compute entropy and display.
entropy = nir$entropy(square)
ee_map(eeobject = entropy,
       vizparams = list(min=1, max=5, palette=c('0000CC', 'CC0000')),
       center = c(-122.466123, 37.769833), # San Francisco Bay
       zoom_start = 17,
       objname = 'entropy')

# Compute the gray-level co-occurrence matrix (GLCM), get contrast.
glcm = nir$glcmTexture(size=4)
contrast = glcm$select('N_contrast')
ee_map(eeobject = contrast,
       vizparams = list(min=0, max=1500, palette=c('0000CC', 'CC0000')),
       center = c(-122.466123, 37.769833), # San Francisco Bay
       zoom_start = 17,
       objname = 'contrast')

# Create a list of weights for a 9x9 kernel.
list = list(1, 1, 1, 1, 1, 1, 1, 1, 1)
# The center of the kernel is zero.
centerList = list(1, 1, 1, 1, 0, 1, 1, 1, 1)
# Assemble a list of lists: the 9x9 kernel weights as a 2-D matrix.
lists = list(list, list, list, list, centerList, list, list, list, list)
# Create the kernel from the weights.
# Non-zero weights represent the spatial neighborhood.
kernel = ee$Kernel$fixed(9, 9, lists, -4, -4, FALSE)

# Convert the neighborhood into multiple bands.
neighs = nir$neighborhoodToBands(kernel)

# Compute local Geary's C, a measure of spatial association.
gearys = nir$subtract(neighs)$pow(2)$reduce(ee$Reducer$sum())$divide(9^2)
ee_map(eeobject = gearys,
       vizparams = list(min=20, max=2500, palette=c('0000CC', 'CC0000')),
       center = c(-122.466123, 37.769833), # San Francisco Bay
       zoom_start = 17,
       objname = "Geary's C")
