## Tutorial 01 - Creating a Basic World Map

*Tutorial created by Will Geary (wcg2111@columbia.edu) for the Spring 2017 [Mapping for Asian/Americas Art](https://github.com/willgeary/MappingAsianAmericasArt) course at Columbia University*

This tutorial will describe the necessary steps to create and style a basic world map and export it as a PDF file in QGIS. If you haven't downloaded QGIS, you can find it [here](https://www.qgis.org/en/site/forusers/download.html).

### Datasets
To create this map, we will be using data from [Natural Earth](http://www.naturalearthdata.com/downloads/), a free, public domain map dataset. Download the following datasets:
* [Large Scale Data - Cultural](http://www.naturalearthdata.com/downloads/10m-cultural-vectors/). Click 'Download all 10m cultural themes'.
* [Large Scale Data - Physical](http://www.naturalearthdata.com/downloads/10m-physical-vectors/). Click 'Download all 10m physical themes'.

This download may take up to 30 minutes, but it is worth it!

### Creating a Basic World Map
First, you need to open QGIS and add the layers that you want to map.
* To add *shapefiles* click on the `Add Vector Layer` button. Other types of data will be added using the other buttons, but in this tutorial we will only be using vector data (shapefiles). Other types of data include *rasters*, *csv* (comma separated values), and *postGIS* layers.

![Add Layer](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_Adding_Layers.png)
* Make sure you select the files with the extension `.shp`. Remember that a *shapefile* is actually made up of 5 or 6 individual files with different extensions. Normally, these individual files are the following:
  * .shp - The main file that stores the feature geometry (required).
  * .shx - The index file that stores the index of the feature geometry (required).
  * .dbf - The dBASE table that stores the attribute information of features (required).
  * .sbn and .sbx - The files that store the spatial index of features (these might get corrupted, see note at the end of this tutorial).
  * .prj - The file that stores the coordinate system information.
