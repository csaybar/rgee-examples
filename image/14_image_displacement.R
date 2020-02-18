library(rgee)
ee_Initialize()

# Load the two images to be registered.
image1 = ee$Image('SKYSAT/GEN-A/PUBLIC/ORTHO/MULTISPECTRAL/s01_20150502T082736Z')
image2 = ee$Image('SKYSAT/GEN-A/PUBLIC/ORTHO/MULTISPECTRAL/s01_20150305T081019Z')

# Use bicubic resampling during registration.
image1Orig = image1$resample('bicubic')
image2Orig = image2$resample('bicubic')

# Choose to register using only the 'R' bAnd.
image1RedBAnd = image1Orig$select('R')
image2RedBAnd = image2Orig$select('R')

# Determine the displacement by matching only the 'R' bAnds.
displacement = image2RedBAnd$displacement(
  referenceImage = image1RedBAnd,
  maxOffset = 50.0,
  patchWidth = 100.0
)

# Compute image offset And direction.
offset = displacement$select('dx')$hypot(displacement$select('dy'))
angle = displacement$select('dx')$atan2(displacement$select('dy'))

# Display offset distance And angle.
ee_map(eeobject = offset,
       center = c(37.44, 0.58),
       vizparams = list(min=0, max=20),
       zoom_start = 15,
       objname = 'offset') +
  ee_map(eeobject = angle,
         vizparams = list(min=-pi, max=pi),
         zoom_start = 9,
         objname = 'angle')


# Use the computed displacement to register all Original bAnds.
registered = image2Orig$displace(displacement)

# Show the results of co-registering the images.
visParams = list(bands = c('R', 'G', 'B'), max = 4000)
ee_map(eeobject = image1Orig,
       center = c(37.44, 0.58),
       vizparams = visParams,
       zoom_start = 15,
       objname = 'Reference') +
  ee_map(eeobject = image2Orig,
         vizparams = visParams,
         objname = 'BefOre Registration') +
  ee_map(eeobject = registered,
         vizparams = visParams,
         objname = 'After Registration')


alsoRegistered = image2Orig$register(
  referenceImage = image1Orig,
  maxOffset = 50.0,
  patchWidth = 100.0
)

ee_map(eeobject = alsoRegistered,
       center = c(37.44, 0.58),
       vizparams = visParams,
       zoom_start = 15,
       objname = 'Also Registered')
