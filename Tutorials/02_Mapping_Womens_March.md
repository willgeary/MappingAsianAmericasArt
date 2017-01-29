## Tutorial 02 - Mapping the Women's March

*Tutorial created by Will Geary (wcg2111@columbia.edu) for the Spring 2017 [Mapping for Asian/Americas Art](https://github.com/willgeary/MappingAsianAmericasArt) course at Columbia University*

This tutorial will walk through the process of using publicly available data to make a [bubble map](http://www.datavizcatalogue.com/methods/bubble_map.html) in QGIS. If you haven't downloaded QGIS, you can find it [here](https://www.qgis.org/en/site/forusers/download.html).

### Background
Much ado has been about the size of attendance of the women's march in Washington, D.C. and elsewhere. Crowd scientists have released estimates of the size of the march in Washington, ranging from 390,000 to 490,000 people. They used a “tethered aerostat,” which is a balloon the size of a minivan, carrying a nine-lens camera to capture a 360-degree view of the crowd.

![Crowd Science](https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/CrowdScience.jpg)

*There are two separate overlays. The yellow dots represent an individual person, which has been hand counted and sampled for density. The red, yellow, and orange polygons are a general indicator of density by zone. Digital Design & Imaging Service. [Link](http://www.mercurynews.com/2017/01/27/440000-people-marched-in-washington-d-c-heres-how-we-know/)*

We will use publicly available data to create a bubble map visualizing the sizes of women's marches in the U.S., similar to the below map from Vox:

![Women's March](https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/WomensMarchMap.jpg)

### Data
To create the dataset for this map, we will scrape data from [this article](http://fivethirtyeight.com/features/the-long-march-ahead-for-democrats/). Scroll down until you see the table below, showing the largest U.S. women's marches by city, along with the source of the estimate and any relevant notes.

![Biggest Marches](https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/biggestMarches.png)

Select and copy the entire table into a new Google Sheet, like this:

![GoogleSheet]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/GoogleSheet.png)












### Add the Layers
First, you need to open QGIS and add the layers that you want to map.
* To add *shapefiles* click on the `Add Vector Layer` button. Other types of data will be added using the other buttons, but in this tutorial we will only be using vector data (shapefiles). Other types of data include *rasters*, *csv* (comma separated values), and *postGIS* layers.

![Add Layer](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_add_layer.png)
* Make sure you select the files with the extension `.shp`. Remember that a *shapefile* is actually made up of 5 or 6 individual files with different extensions. Normally, these individual files are the following:
  * .shp - The main file that stores the feature geometry (required).
  * .shx - The index file that stores the index of the feature geometry (required).
  * .dbf - The dBASE table that stores the attribute information of features (required).
  * .sbn and .sbx - The files that store the spatial index of features (these might get corrupted, see note at the end of this tutorial).
  * .prj - The file that stores the coordinate system information.
  
Open the *Physical Vectors* folder and add the following shapefiles to your map:
* ne_10m_land.shp
* ne_10m_ocean.shp
* ne_10m_lakes.shp

Next, open the *Cultural Vectors* folder and add the following shapefiles to your map:
* ne_10m_admin_0_countries_lakes.shp
* ne_10m_admin_1_states_provinces_lakes_shp.shp
* ne_10m_rivers_lake_centerlines.shp

You should now have something like this (don't worry if your colors look different - QGIS assigns random colors when you add layers):

![World Basemap](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_world_basemap.png)
