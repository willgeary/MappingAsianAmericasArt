## Tutorial 01 - Creating a Basic World Map

*Tutorial created by Will Geary (wcg2111@columbia.edu) for the Spring 2017 [Mapping for Asian/Americas Art](https://github.com/willgeary/MappingAsianAmericasArt) course at Columbia University*

This tutorial will describe the necessary steps to create and style a basic world map and export it as a PDF file in QGIS. If you haven't downloaded QGIS, you can find it [here](https://www.qgis.org/en/site/forusers/download.html).

### Datasets
To create this map, we will be using data from [Natural Earth](http://www.naturalearthdata.com/downloads/), a free, public domain map dataset. Download the following datasets:
* [Large Scale Data - Cultural Vectors](http://www.naturalearthdata.com/downloads/10m-cultural-vectors/). Click 'Download all 10m cultural themes'.
* [Large Scale Data - Physical Vectors](http://www.naturalearthdata.com/downloads/10m-physical-vectors/). Click 'Download all 10m physical themes'.

This download may take up to 30 minutes, but it is worth it!

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
 
### Style the Layers
Clearly, our map needs some styling.
 
First, let's give the layers names that are more intuitive. Rename a laye by right clicking on it in the Layers Panel and selecting 'Rename', like this:

![Rename Layer](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_rename.png)

I chose to give my layers the following names: Rivers, States, Countries, Lakes, Ocean, Land.

Now, let's customize the color scheme. Double-click on the Rivers layer and the `Layer Properties` window will pop up. Select the `Style` tab. Here, you can change the fill (color), stroke weight and fill (outline) and the size of the icon (if using points or icons).

Make the following style changes:
* Rivers
  * Color: #1f78b4ff
  * Width: 0.06
* States
  * Fill Color: Transparent
  * Border Color: #ae6b34ff
  * Border Width: 0.06
* Countries
  * Fill Color: Transparent
  * Border Color: #000000ff
  * Border Width: 0.10
* Lakes
  * Fill Color: #a5bfddff
  * Border Color: #728584ff
  * Border Width: 0.26
* Ocean
  * Fill Color: #a5bfddff
  * Border Color: #728584ff
  * Border Width: 0.26
* Land
  * Fill Color: #f1f4c7ff
  * Border Color: #afb38aff
  * Border Width: 0.26
  
Now, you should have something like this:

![World](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_world.png)

Zoom in to South America by clicking the zoom-in magnifying glass (+) on the upper toolbar and dragging a rectangle around South America, like this:

![Zoom](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_zoom.png)

Note that you can zoom out to show the entire world map by right clicking on the Land layer (or any of them, for that matter) and selecting 'Zoom to Layer', like this:

![Zoom to Layer](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_zoomlayer.png)

### Add Points for Major Cities in Brazil

Let's add labels for the major cities in Brazil. Add the `ne_10m_populated_places_simple.shp` layer to your map. You should see something like this:

![Populated Places](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_populated_places.png)

As we only want to label the major cities in Brazil, let's limit this dataset to only include cities that are both:

1) In Brazil
2) Population greater than or equal to one million

To do this, right click on the `ne_10m_populated_places_simple.shp` layer and select 'Open Attribute Table', like this:

![Attrib Table](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_attrib_table.png)

Notice that the 'sov0name' column contains country name and the 'pop_max' column contains population. We will use these two columns to select Brazilian cities with population >= one million.

First, let's select all cities that are in Brazil. Click the 'Select features using an expression' button in the Attribute Table. This will bring up the following window:

![Select Table](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_select_table.png)

Click on the 'Fields and Values' drop-down menu and double-click 'sov0name'. This will add 'sov0name' to the expression space on the left-hand side of the window. After "sov0name" type the following: = 'Brazil'. Your expression should look like this:

![Select Brazil](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_select_brazil.png)

Now click 'Select'. This will highlight all of the rows in the attribute table where sov0name = Brazil. Close out of the attribute table. Brazilian cities should be highlighted in yellow, like this:

![Brazil Yellow](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_brazil_yellow.png)

Right click the `ne_10m_populated_places_simple` layer and select 'Save As...'. This will bring up the Save As window. Give the new layer a name, such as Brazil Cities, and be sure to check the 'Save only selected features' box (otherwise non-Brazilian cities will be included in the new layer). Your window should look like this:

![Save As](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_save_as.png)

Click OK, and this new layer will be added to your map. Uncheck the box next to `ne_10m_populated_places_simple` to view the Brazilian cities, like this:

![Brazil Cities](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_brazil_cities.png)

Now, let's limit these cities to only include those with population >= one million. Open the attribute table for the Brazil Cities layer and click the Select by expression button again. Under Fields and Values, double click pop_max. In the left-hand window type: >= 1000000. Your window should look like this:

![Brazil Big Cities](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_big_cities.png)

Click 'Select'. This will highlight all of the rows in the attribute table where pop_max is greater than or equal to 1,000,000. Close out of the attribute table. The big cities should be highlighted in yellow, like this:

![Brazil Big Cities Yellow](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_big_cities_yellow.png)

Again, let's save this as a new layer and only include the selected features. Right click the 'Brazil Cities' layer and select Save As. Give the new layer a name like 'Brazil Big Cities' and be sure to check the 'Save only selected features' box. Click OK. 

Now you should have dots showing Brazilian cities with population >= one million, like this:

![Brazil Big Cities](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_brazil_big_cities.png)

### Label the Cities

This map is rather useless without labels, so let's add text labels showing the names of these major Brazilian cities. In the Layer menu, select 'Labeling', like this:

![Labeling](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_labeling.png)

This will open the Layer labeling settings window. Select 'Show labels for this layer' from the drop-down menu. Click on the blue button next to the 'Label with' box and select 'name' like this:

![Label Settings 1](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_label_settings1.png)

Click OK and you should see city labels like this:

![Labels 1](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_labels1.png)

Let's give the text a white buffer to make it easier to read, and offset the labels a bit so they are not overlapping with the points. Open the Layer labeling settings window again and make the following changes:

Check 'Draw text buffer':

![Text Buffer](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_buffer.png)

In the 'Placement' menu, select Cartographic and give it a distance of 2.0 units, like this:

![Placement](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/Images/01_World_Map/01_placement.png)




































 


