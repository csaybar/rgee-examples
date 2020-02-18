library(rgee)
ee_Initialize()

# Load an image.
image = ee$Image("LANDSAT/LC08/C01/T1/LC08_044034_20140318")

# Display the image.
ee_map(image, zoom_start = 9, objname = "Landsat 8 original image")

# Define visualization parameters in an object literal.
vizParams = list(
  bands = c("B5", "B4", "B3"),
  min = 5000, max = 15000, gamma = 1.3
)

ee_map(image, vizParams, objname = "Landsat 8 False color")

# Use ee_map to add features and feature collections to the map. For example,
counties = ee$FeatureCollection("TIGER/2016/Counties")
ee_map(
  eeobject = ee$Image()$paint(counties, 0, 2),
  center = c(-99, 38),
  zoom_start = 7,
  objname = "counties"
)
