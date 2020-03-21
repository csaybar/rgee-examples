library(rgee)
ee_Initialize()

fromFT <- ee$FeatureCollection("users/wqs/Pipestem/Pipestem_HUC10")
geom <- fromFT$geometry()

ee_map(eeobject = fromFT) +
  ee_map(
    eeobject = ee$Image()$paint(geom, 0, 2),
    objname = "Watersheds"
  )

stats <- fromFT$reduceColumns(
  reducer = ee$Reducer$sum()$`repeat`(2),
  selectors = list("AreaSqKm", "AreaAcres")
  # weightSelectors: ['weight']
)$getInfo()

print(stats)
