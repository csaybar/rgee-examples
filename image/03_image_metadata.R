library(rgee)
ee_Initialize()

image = ee$Image('LANDSAT/LC8_L1T/LC80440342014077LGN00')

bandNames = image$bandNames()
print('Band names: ');print(bandNames$getInfo())# ee$List

b1proj = image$select('B1')$projection()
print('Band 1 projection: ');print(b1proj$getInfo()) # ee$Projection

b1scale = image$select('B1')$projection()$nominalScale()
print('Band 1 scale: ');print(b1scale$getInfo()) # ee$Number

b8scale = image$select('B8')$projection()$nominalScale()
print('Band 8 scale: ');print(b8scale$getInfo()) # ee$Number

properties = image$propertyNames()
print('Metadata properties: ');print(properties$getInfo()) # ee$List

cloudiness = image$get('CLOUD_COVER')
print('CLOUD_COVER: ');print(cloudiness$getInfo()) # ee$Number

date = ee$Date(image$get('system:time_start'))
print('Timestamp: ');print(date$getInfo()) # ee$Date
