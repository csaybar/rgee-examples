library(rgee)
ee_Initialize()

fromFT <- ee$FeatureCollection("users/wqs/Pipestem/Pipestem_HUC10")
geom <- fromFT$geometry()

ee_map(eeobject = fromFT) +
  ee_map(
    eeobject = ee$Image()$paint(geom, 0, 2),
    objname = "Watersheds"
  )

print(fromFT$aggregate_stats("AreaSqKm"))

total_area <- fromFT$reduceColumns(
  reducer = ee$Reducer$sum(),
  selectors = list("AreaSqKm")
  # weightSelectors = 'weight'
)$getInfo()

cat("Total area: ", total_area$sum)
