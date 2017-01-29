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

### You can make maps in Google Sheets!

Right off the bat, we can visualize this information in Google Sheets. Select the first two columns (City, Estimated Crowd), click the `Insert` menu and select `Chart`, like this:

![InsertMap]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/InsertMap.png)

This will bring up the Chart Editor window. Select `Chart types`, scroll down to the very bottom and select `Geo chart with markers` like this:

![GeoChart]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/geochart.png)

Click `Insert`.

And a bubble map will automatically appear! You can adjust the zoom level and colors in the `Advanced edit` menu to make something like this:

![GoogleMap]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/GoogleMap.png)

The Google Sheets map is convenient and looks nice, but it's quite limited. Let's create the map in QGIS.

### Geocoding

But wait! There's a problem.

QGIS **needs latitude/longitude coordinates to plot points**. We only have city names. 

We need to convert place names (that are understood by humans) into lat/lon coordinates (that are understood by computers). This process is known as **Geocoding**, and it comes up very often in cartography. Luckily, it is quite easy!

There are many tools we could use to geocode these cities. We could use a service like [Geocod.io](https://geocod.io/), we could query Google Maps API (free, but limited to 2,500 requests per day), or we could write a custom Google Script to create geocoding functionality directly within Google Sheets.

Here, we'll take the latter approach and create a geocoding function directly within Google Sheets.

You may find a separate tutorial on geocoding in Google Sheets [here](https://github.com/willgeary/MappingAsianAmericasArt/blob/master/Tutorials/02_Womens_March_Geocoding.md). Follow all of the steps here before continuing.

---

Now that we have our geocoding function in Google Sheets, let's go ahead and geocode these cities into lat/lon coordinates.

Insert two empty columns to the right of the City column. Select all of the cities ***and*** the two columns to the right, like below. This will indicate to the geocode function where we want the lat/lon coordinates to go.

![GoogleMap]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/selectColumns.png)

With these cells selected, select `Geocode` and click `Geocode Selected Cells (Address to Lat, Long)`. 

Magic!! 

![Magic]
(https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/02_Mapping_Womens_March/geocodeGIF.gif)

A few final data processing steps:
* Label column B `Latitude` and column C `Longitude` (this will enable QGIS to automatically recognize them)
* Adjust the formatting of the lat/lon coordinates so all decimals are shown
* Adjust the formatting of the Estimated Crowd numbers so there are **no separating commas** by selecting that column and clicking `Format` -> `Number` -> `Plain text` (sometimes these commas trip up QGIS).

And we're ready! Download this file as a csv.

### Mapping points in QGIS

First, load in the following layers to QGIS:
* ne_10m_ocean
* ne_10m_land
* ne_10m_lakes
* ne_10m_admin_1_states_provinces_lakes_shp

Like this:

![baseLayer]
(http://i.imgur.com/WDLTC6a.png)

Now, let's load in the csv containing our data. Select `Layer` -> `Add Layer` -> `Add Delimited Text Layer...`, like this:

![textLayer]
(http://i.imgur.com/4YHel2E.png)

Find the Women's March csv file and click `Open`.

Be sure that `Point coordinates` is checked and `X field` is Longitude and `Y field` is Latitude. QGIS will often find these columns correctly if you label them correctly -- but sometimes it doesn't, so you may need to manually tell it to read in the Latitude and Longitude columns. Like this:

![Points]
(http://i.imgur.com/N5TxRYF.png)





 














