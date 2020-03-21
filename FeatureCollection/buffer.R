# Display the area within 2 kilometers of any San Francisco BART station.
library(rgee)
ee_Initialize()

bart_stations <- ee$FeatureCollection(
  "ft:1xCCZkVn8DIkB7i7RVkvsYWxAxsdsQZ6SbD9PCXw"
)
buffered <- bart_stations$map(function(x) x$buffer(2000))
unioned <- buffered$union()

ee_map(
  eeobject = unioned,
  vizparams = list(color = "800080"),
  objname = "BART stations"
)
