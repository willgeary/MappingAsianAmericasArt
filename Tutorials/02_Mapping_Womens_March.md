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


