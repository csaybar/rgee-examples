library(rgee)
ee_Initialize()


image1 = ee$Image(1)
print(image1)
print(image1$getInfo())

image2 = ee$Image(2)
image3 = ee$Image$cat(c(image1, image2))
print(image3$getInfo())

multiband = ee$Image(c(1, 2, 3))
print(multiband)
renamed = multiband$select(c('constant','constant_1','constant_2'),c('band1','band2','band3'))
print(renamed)
