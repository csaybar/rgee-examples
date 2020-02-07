library(rgee)
ee_Initialize()

# Load and display a Landsat TOA image.
image <- ee$Image("LANDSAT/LC08/C01/T1_TOA/LC08_044034_20140318")
ee_map(image, list(bands = c("B4", "B3", "B2"), max = 30000), objname = "Landsat 8")

# Create an arbitrary rectangle as a region and display it.
region <- ee$Geometry$Rectangle(-122.2806, 37.1209, -122.0554, 37.2413)
center <- region$centroid()$coordinates()$getInfo()
ee_map(
  eeobject = ee$Image()$paint(region, 0, 2),
  center = center,
  zoom_start = 9,
  objname = "Region"
)

# Get a dictionary of means in the region.  Keys are bandnames.
mean <- image$reduceRegion(
  reducer = ee$Reducer$mean(),
  geometry = region,
  scale = 30
)

print(mean$getInfo())
