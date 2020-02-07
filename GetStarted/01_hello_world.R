library(rgee)
ee_Initialize()

# traditional R character
print("Hello world!")

# Earth Engine object
print(ee$String("Hello World from Earth Engine!")$getInfo())
print(ee$Image("LANDSAT/LC08/C01/T1/LC08_044034_20140318")$getInfo())
