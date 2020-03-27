# rgee-examples

A collection of **300+** examples for using Google Earth Engine with R. 

## 1. Description

This repository is a collection of **300+** R script examples. The mayority of theses examples were adapted from converting the repos [qgis-earthengine-examples](https://github.com/giswqs/qgis-earthengine-examples) and [earthengine-py-notebooks](https://github.com/giswqs/earthengine-py-notebooks) from Python to R. Recognition for organize and develop these amazing examples should always be given to the Professor [Qiusheng Wu](https://wetlands.io).

## 2. Installation

Install the `rgee` package from GitHub is quite simple, you just have to run in your R console as follows:

``` r
remotes::install_github("csaybar/rgee")
```

**`rgee` depends on [sf](https://github.com/r-spatial/sf)**. Therefore, it is necessary to install its external libraries, follow the installation steps specified [here](https://github.com/r-spatial/sf#installing).

#### Docker image
    
    docker pull csaybar/rgee
    docker run -d -p 8787:8787 -e USER=rgee -e PASSWORD=rgee --name rgee-dev csaybar/rgee

After that, in your preferred browser, run:

    127.0.0.1:8787

### 3. Requirements

Prior to using `rgee` you will need to install a **Python version higher than 3.5** in your system. `rgee` counts with a installation module, use it to quickly set up the external dependencies of `rgee`:

```r
library(rgee)

# 1. Initialize rgee with ee_Initialize(). If there is no any Python environment, miniconda
# will be installed by default.
ee_Initialize()

# 2. Create a Python environment, e.g. ee.
ee_create_pyenv(python_env = "ee")

# 3. Find all Python environments  in the system.
ee_discover_pyenvs()

# 4. Set a Python environment (e.g. ee) and restart R to see changes. e.g
ee_set_pyenv(
  python_path = '/home/MY_USER_HERE/.virtualenvs/ee/bin/python',
  python_env = 'ee'
)

# 5. Install Python package dependencies
ee_install_python_packages()

# 6. Initialize rgee again!
ee_Initialize()
```

Additionally, use the functions below, as many times as you want, for checking user info, check sanity of credentials and  Python packages, and remove credentials.

```r
ee_check() # Check non-R dependencies
ee_user_info() # Display credentials information
ee_users() # Display credentials information of all users
ee_remove_credentials() # Remove credentials of a specific user
ee_clean_pyenv() # Remove reticulate system variables
```

Also, consider checking the [setup section](https://csaybar.github.io/rgee/articles/setup.html) for major information to customizing Python installation.


## 4. Examples

The Table of Contents below mimics the structure of the Google Earth Engine [API Documentation](https://developers.google.com/earth-engine). I strongly encourage you to check out the API Documentation if you need an in-depth explanation of each R example. Please note that the list below does not include all the R examples contained in this repository. You are welcome to explore the repository and find more examples to suit your needs.

### [Get Started](https://github.com/csaybar/rgee-examples/tree/master/GetStarted)

* [Hello world!](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/01_hello_world.R)
* [Adding data to Map](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/02_simple_mapdisplay.R)
* [Finding images](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/03_finding_images.R)
* [Band math](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/04_band_math.R)
* [Mapping (what to do instead of a for-loop)](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/05_map_function.R)
* [Reducing](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/06_reducing.R)
* [Image statistics](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/07_image_statistics.R)
* [Masking](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/08_masking.R)
* [A complete example](https://github.com/csaybar/rgee-examples/blob/master/GetStarted/09_a_complete_example.R)

### [Machine Learning](https://github.com/csaybar/rgee-examples/tree/master/MachineLearning)

* Supervised Classification Algorithms
* [Classification and Regression Trees (CART)](https://github.com/csaybar/rgee-examples/blob/master/MachineLearning/cart_classifier.R) | [Support Vector Machine (SVM)](https://github.com/csaybar/rgee-examples/blob/master/MachineLearning/svm_classifier.R) | [Confusion Matrix](https://github.com/csaybar/rgee-examples/blob/master/MachineLearning/confusion_matrix.R)
* Unsupervised Classification Algorithms
* [KMeans Clustering](https://github.com/csaybar/rgee-examples/blob/master/MachineLearning/clustering.R)

### [Image](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image)

* [Image Overview](https://github.com/csaybar/rgee-examples/blob/master/image/01_image_overview.R)
* [Image Visualization](https://github.com/csaybar/rgee-examples/blob/master/image/02_image_vis.R)
* [Image information and metadata](https://github.com/csaybar/rgee-examples/blob/master/image/03_image_metadata.R)
* [Mathematical operations](https://github.com/csaybar/rgee-examples/blob/master/image/04_band_math.R)
* [Relational, conditional and Boolean operations](https://github.com/csaybar/rgee-examples/blob/master/image/05_conditional_operations.R)
* [Convolutions](https://github.com/csaybar/rgee-examples/blob/master/image/06_convolutions.R)
* [Morphological Operations](https://github.com/csaybar/rgee-examples/blob/master/image/07_morphological_operations.R)
* [Gradients](https://github.com/csaybar/rgee-examples/blob/master/image/08_gradients.R)
* [Edge detection](https://github.com/csaybar/rgee-examples/blob/master/image/09_edge_detection.R)
* [Spectral transformations](https://github.com/csaybar/rgee-examples/blob/master/image/10_spectral_unmixing.R)
* [Texture](https://github.com/csaybar/rgee-examples/blob/master/image/11_texture.R)
* [Object-based methods](https://github.com/csaybar/rgee-examples/blob/master/image/12_object_based.R)
* [Cumulative Cost Mapping](https://github.com/csaybar/rgee-examples/blob/master/image/13_cumulative_cost_mapping.R)
* [Registering Images](https://github.com/csaybar/rgee-examples/blob/master/image/14_image_displacement.R)
* Miscellaneous
* [Band statistics (min, max, mean, std)](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/band_stats.R) | [Image statistics by band](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/image_stats_by_band.R) | [Extract value to points](https://github.com/csaybar/rgee-examples/blob/master/Image/extract_value_to_points.R) | [Rename bands](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/rename_bands.R) | [Clipping](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/clipping.R) | [Find image by path and row](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/find_image_by_path_row.R) | [Get image resolution](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/get_image_resolution.R) | [Get image extent](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/get_image_extent.R) | [Set image properties](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/set_image_properties.R) | [Select bands](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/select_bands.R) | [Convert bands to ImageCollection](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/convert_bands_to_image_collection.R) | [Reclassify](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/reclassify.R) | [Composite bands](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/composite_bands.R) | [Image smoothing](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/image_smoothing.R) | [Download image](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/download.R) | [Cell statistics](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/cell_statistics.R) | [Image patch area](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/image_patch_area.R) | [Get image id](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/get_image_id.R) | [Get band name and type](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Image/get_band_name_and_type.R) | [Filtering by calendar range](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/filtering_by_calendar_range.R) 

### [ImageCollection](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection)

* [ImageCollection Overview](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/01_overview.R)
* [ImageCollection Information and Metadata](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/02_metadata.R)
* [Filtering an ImageCollection](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/03_filtering_collection.R)
* [Mapping over an ImageCollection](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/04_map_function.R)
* [Reducing an ImageCollection](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/05_reducing_collection.R)
* [Compositing and Mosaicking](https://github.com/csaybar/rgee-examples/blob/master/ImageCollection/06_mosaicking.R)
* Miscellaneous
* [Get image centroid](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/get_image_centroid.R) | [Convert ImageCollection to Image](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/convert_imagecollection_to_image.R) | [Sort by cloud and date](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/sort_by_cloud_and_date.R) | [Filtering by metadata](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/filtering_by_metadata.R) | [Filtering by band names](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/filtering_by_band_names.R) | [Select image by index](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/select_image_by_index.R) | [Creating monthly imagery](https://github.com/giswqs/earthengine-py-notebooks/tree/master/ImageCollection/creating_monthly_imagery.R)

### [Geometry, Feature, FeatureCollection](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection)

* [Geometry Overview](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/creating_feature.R)
* [Geodesic vs. Planar Geometries](https://github.com/csaybar/rgee-examples/blob/master/Visualization/visualizing_geometries.R)
* [Geometry Visualization and Information](https://github.com/csaybar/rgee-examples/blob/master/Visualization/visualizing_geometries.R)
* [Geometric Operations](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/geometric_operations.R)
* [Feature Overview](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/creating_feature.R)
* [FeatureCollection Overview](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/from_polygons.R)
* [Feature and FeatureCollection Visualization](https://github.com/csaybar/rgee-examples/blob/master/Visualization/visualizing_feature_collection.R)
* [FeatureCollection Information and Metadata](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/metadata_aggregation.R)
* [Filtering a FeatureCollection](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/filtering_feature_collection.R)
* [Mapping over a FeatureCollection](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/map_function.R)
* [Reducing a FeatureCollection](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/reducing_feature_collection.R)
* [Vector to Raster Interpolation](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/idw_interpolation.R)
* Miscellaneous
* [Add new attribute](https://github.com/csaybar/rgee-examples/blob/master/FeatureCollection/add_new_attribute.R) | [Add area column](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/add_area_column.R) | [Add random value column](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/add_random_value_column.R) | [Single column statistics](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/column_statistics.R) | [Multiple column statistics](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/column_statistics_multiple.R) | [Simplify polygons](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/simplify_polygons.R) | [Column statistics by group](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/column_statistics_by_group.R) | [Select by location](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/select_by_location.R) | [Select by attributes](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/select_by_attributes.R) | [Select by strings](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/select_by_strings.R) | [Vector symbology](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/vector_symbology.R) | [Merge FeatureCollection](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/merge_feature_collections.R) | [Search by buffer distance](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/search_by_buffer_distance.R) | [Select columns](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/select_columns.R) | [Mimimum bounding geometry](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/minimum_bounding_geometry.R) | [Clipping polygons](https://github.com/giswqs/earthengine-py-notebooks/tree/master/FeatureCollection/clipping.R)

### [Reducer](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Reducer)

* [Reducer Overview](https://github.com/csaybar/rgee-examples/blob/master/Reducer/min_max_reducer.R)
* [ImageCollection Reductions](https://github.com/csaybar/rgee-examples/blob/master/Reducer/median_reducer.R)
* [Image Reductions](https://github.com/csaybar/rgee-examples/blob/master/Reducer/image_reductions.R)
* [Statistics of an Image Region](https://github.com/csaybar/rgee-examples/blob/master/Reducer/stats_of_an_image_region.R)
* [Statistics of Image Regions](https://github.com/csaybar/rgee-examples/blob/master/Reducer/stats_of_image_regions.R)
* [Statistics of Image Neighborhoods](https://github.com/csaybar/rgee-examples/blob/master/Reducer/stats_of_image_neighborhoods.R)
* [Statistics of FeatureCollection Columns](https://github.com/csaybar/rgee-examples/blob/master/Reducer/stats_of_columns.R)
* [Raster to Vector Conversion](https://github.com/csaybar/rgee-examples/blob/master/Reducer/convert_raster_to_vector.R)
* [Vector to Raster Conversion](https://github.com/csaybar/rgee-examples/blob/master/Reducer/convert_vector_to_raster.R)
* Grouped Reductions and Zonal Statistics
* [Statistics by group](https://github.com/csaybar/rgee-examples/blob/master/Reducer/stats_by_group.R) | [Zonal Statistics](https://github.com/csaybar/rgee-examples/blob/master/Reducer/zonal_statistics.R)
* [Weighted Reductions](https://github.com/csaybar/rgee-examples/blob/master/Reducer/weighted_reductions.R)
* [Linear Regression](https://github.com/csaybar/rgee-examples/blob/master/Reducer/linear_regression.R)

### [Join](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Join)

* [Simple Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/simple_joins.R)
* [Inverted Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/inverted_joins.R)
* [Inner Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/inner_joins.R)
* [Save-All Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/save_all_joins.R)
* [Save-Best Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/save_best_joins.R)
* [Spatial Joins](https://github.com/csaybar/rgee-examples/blob/master/Join/spatial_joins.R)

### [Array](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Array)

* [Arrays and Array Images](https://github.com/csaybar/rgee-examples/blob/master/Array/array_images.R)
* [Array Transformations](https://github.com/csaybar/rgee-examples/blob/master/Array/array_transformations.R)
* [Eigen Analysis](https://github.com/csaybar/rgee-examples/blob/master/Array/eigen_analysis.R)
* [Array Sorting and Reducing](https://github.com/csaybar/rgee-examples/blob/master/Array/array_sorting.R)

### [Specialized Algorithms](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Algorithms)

* Landsat Algorithms
* [Radiance](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/landsat_radiance.R) | [Surface Reflectance](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/landsat_surface_reflectance.R) | [Simple cloud score](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/landsat_cloud_score.R) | [Simple composite](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/landsat_simple_composite.R)
* [Sentinel-1 Algorithms](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/sentinel-1_filtering.R)
* Resampling and Reducing Resolution
* [Resampling](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/resampling.R) | [Reducing Resolution](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/reduce_resolution.R)
* [Linear fit](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/ntl_linear_fit.R)
* Pattern recognition
* [Center-pivot Irrigation Detector](https://github.com/csaybar/rgee-examples/blob/master/Algorithms/center_pivot_irrigation_detector.R)

### [Asset Management](https://github.com/giswqs/earthengine-py-notebooks/tree/master/AssetManagement)

* [Exporting Image](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_raster.R)
* [Exporting ImageCollection](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_ImageCollection.R)
* [Exporting Vector](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_vector.R)
* [Exporting FeatureCollection](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_FeatureCollection.R)
* [Exporting CSV](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_csv.R)
* [Exporting Table](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_table.R)
* [Exporting TimeSeries](https://github.com/csaybar/rgee-examples/blob/master/AssetManagement/export_TimeSeries.R)

### [How Earth Engine Works](https://github.com/giswqs/earthengine-py-notebooks/tree/master/HowEarthEngineWorks)

* [Client vs. Server](https://github.com/csaybar/rgee-examples/blob/master/HowEarthEngineWorks/ClientVsServer.R)
* [Deferred Execution](https://github.com/csaybar/rgee-examples/blob/master/HowEarthEngineWorks/DeferredExecution.R)
* [Projections](https://github.com/csaybar/rgee-examples/blob/master/HowEarthEngineWorks/Projections.R)

### [Filter](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter)

* [Filter to metadata equal to the given value](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_eq.R)
* [Filter to metadata not equal to the given value](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_neq.R)
* [Filter on metadata contained in a list](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_in_list.R)
* [Filter on metadata that cotains a certain string](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_string_contains.R)
* [Filter on metadata that starts with a certain string](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_string_starts_with.R)
* [Filter on metadata that ends with a certain string](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_string_ends_with.R)
* [Filter on metadata that falls within a specified range](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Filter/filter_range_contains.R)

### [Visualization](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization)

* [RGB composite](https://github.com/csaybar/rgee-examples/blob/master/Visualization/image_rgb_composite.R)
* [Color palettes](https://github.com/csaybar/rgee-examples/blob/master/Visualization/image_color_palettes.R)
* [Color ramp](https://github.com/csaybar/rgee-examples/blob/master/Visualization/image_color_ramp.R)
* [Hillshade](https://github.com/csaybar/rgee-examples/blob/master/Visualization/hillshade.R)
* [Image stretch](https://github.com/csaybar/rgee-examples/blob/master/Visualization/image_stretch.R)
* [Image thumbnail](https://github.com/csaybar/rgee-examples/blob/master/Visualization/image_thumbanil.R)
* [Rendering categorical maps](https://github.com/csaybar/rgee-examples/blob/master/Visualization/rendering_categorical_maps.R)
* [Styled layer descriptors](https://github.com/csaybar/rgee-examples/blob/master/Visualization/styled_layer_descriptors.R)
* [Terrain visualization](https://github.com/csaybar/rgee-examples/blob/master/Visualization/terrain_visualization.R)
* [Visualizing FeatureCollection](https://github.com/csaybar/rgee-examples/blob/master/Visualization/visualizing_feature_collection.R)
* [Visualizing Geometry](https://github.com/csaybar/rgee-examples/blob/master/Visualization/visualizing_geometries.R)
* [NLCD Land Cover](https://github.com/csaybar/rgee-examples/blob/master/Visualization/nlcd_land_cover.R)
* [US Counties](https://github.com/csaybar/rgee-examples/blob/master/Visualization/us_counties.R)
* Miscellaneous
* [NDVI symbology](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/ndvi_symbology.R) | [NDWI symbology](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/ndvi_symbology.R) | [Landsat symbology](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/landsat_symbology.R) | [NWI wetlands symbology](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/nwi_wetlands_symbology.R) | [Color by attribute](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/color_by_attribute.R) | [Random color visualizer](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Visualization/random_color_visualizer.R)

### [Datasets](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets)

* [Terrain](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Terrain)
* [Water](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Water)
* [Vector datasets catalog](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors)
* [Large Scale International Boundary Polygons (LSIB)](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/international_boundary.R)
* [TIGER: US 2018 Census Counties](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_counties.R)
* [TIGER: US 2018 Census States](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_states.R)
* [TIGER: US 2016 Census Roads](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_roads.R)
* [TIGER: US 2010 Census Blocks](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_blocks.R)
* [TIGER: US Census 2010 Census Tracts + Demographic Profile 1 aggregate statistics](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_tracts.R)
* [TIGER: US Census 2010 5-digit ZIP Code Tabulation Areas](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_census_zip_code.R)
* [GLIMS: Global Land Ice Measurements from Space](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/global_land_ice_measurements.R)
* [USGS Watershed Boundary Datasets](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/usgs_watershed_boundary.R)
* [USA EPA Ecoregions](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/us_epa_ecoregions.R)
* [RESOLVE Ecoregions](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/resolve_ecoregions.R)
* [World Database on Protected Areas (WDPA)](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/world_database_on_protected_areas.R)
* [WRI Global Power Plant Database](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/global_power_plant_database.R)
* [Landsat WRS-2 grid](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Datasets/Vectors/landsat_wrs2_grid.R)

### [Tutorials](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Tutorials)

* [Global Surface Water](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Tutorials/GlobalSurfaceWater)

### [Gena's Examples](https://github.com/giswqs/earthengine-py-notebooks/tree/master/Gena)

* [Map.addLayer()](https://github.com/csaybar/rgee-examples/blob/master/Gena/map_add_features.R) | [Map.centerObject()](https://github.com/csaybar/rgee-examples/blob/master/Gena/map_center_object.R) | [Map.setCenter()](https://github.com/csaybar/rgee-examples/blob/master/Gena/map_set_center.R)

---
