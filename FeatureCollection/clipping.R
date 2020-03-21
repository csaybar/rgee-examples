library(rgee)
ee_Initialize()

roi <- ee$Geometry$Polygon(
  list(
    c(-73.99891354682285, 40.74560250077625),
    c(-73.99891354682285, 40.74053023068626),
    c(-73.98749806525547, 40.74053023068626),
    c(-73.98749806525547, 40.74560250077625)
  )
)

fc <- ee$FeatureCollection('TIGER/2016/Roads')$filterBounds(roi)
clipped <- fc$map(function(x) x$intersection(roi))


ee_map(eeobject = ee$FeatureCollection(roi),
       zoom_start =  17) +
ee_map(eeobject = ee$Image()$paint(roi, 0, 2),
       vizparams = list(palette = 'yellow'),
       objname = 'ROI',
       zoom_start = 15) +
ee_map(eeobject = ee$Image()$paint(clipped, 0, 3),
       vizparams = list(palette = 'red'),
       objname = 'clipped') +
ee_map(eeobject = fc, objname = 'Census roads')
