---
anchor: Installation
date: "2018-01-27T15:42:17+01:00"
title: rgee installation
weight: 40
---

Install the `rgee` package from GitHub is quite simple, you just have to run in your R console as follows:

``` r
remotes::install_github("r-spatial/rgee")
```

**`rgee` depends on [sf](https://github.com/r-spatial/sf)**. Therefore, is necessary to install its external libraries, follow the installation steps specified [here](https://github.com/r-spatial/sf#installing).

#### Docker image
    
    docker pull csaybar/rgee
    docker run -d -p 8787:8787 -e USER=rgee -e PASSWORD=rgee --name rgee-dev csaybar/rgee

After that, in your preferred browser, run:

    127.0.0.1:8787

### setup

Prior to using `rgee` you will need to install a **Python version higher than 3.5** in their system. `rgee` counts with an installation function (ee_install) which helps to setup `rgee` correctly:

```r
library(rgee)

## It is necessary just once
ee_install()

# Initialize Earth Engine!
ee_Initialize()
```

Additionally, you might use the functions below for checking the status of rgee dependencies and delete credentials.

```r
ee_check() # Check non-R dependencies
ee_clean_credentials() # Remove credentials of a specific user
ee_clean_pyenv() # Remove reticulate system variables
```

Also, consider looking at the [setup section](https://r-spatial.github.io/rgee/articles/setup.html) for more information on customizing your Python installation.
