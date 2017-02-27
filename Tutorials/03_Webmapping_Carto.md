## Tutorial 03 - Intro to Web-mapping with [Carto](https://carto.com/)

*Tutorial created by Will Geary (wcg2111@columbia.edu) for the Spring 2017 [Mapping for Asian/Americas Art](https://github.com/willgeary/MappingAsianAmericasArt) course at Columbia University*

This tutorial will walk through the process of creating an interactive webmap with Carto. We will use data from the [Armed Conflict Location & Event Data Project (ACLED)](http://www.acleddata.com/data/realtime-data) to create a conflict map of the Democratic Republic of Congo.


### Background

We will create a map like this:

[![Map](https://raw.githubusercontent.com/willgeary/willgeary.github.io/master/assets/DRC-conflict-map.png)](https://willgeary.github.io/DRCdashboard/)


### Data

We will use this data set: (ACLED Realtime Data - Processed)[https://github.com/willgeary/DRCdashboard/blob/master/data/ACLED-All-Africa-Clean.csv]. Check it out and see what type of information it contains.

Download the data to csv by clicking here: https://www.dropbox.com/s/nfogb2zqr0qvieh/ACLED-All-Africa-Clean.csv?dl=0

FYI - I created this dataset by doing some processing to the "Realtime 2017 All Africa File (updated 25th February 2017)" file found here: http://www.acleddata.com/data/realtime-data. If you are curious what data processing steps I took, please see my [python notebook](http://nbviewer.jupyter.org/github/willgeary/DRCdashboard/blob/master/Tutorial.ipynb).

### Create Account on Carto

Navigate to [Carto](https://carto.com/) and click `Sign up`. I suggest you sign up with your columbia.edu email address, because Carto gives extra storage to student users.

### Upload Dataset to Carto

Click 'New Map'. Click 'Connect Dataset'. Drag and drop othe ACLED-All-Africa-Clean.csv into the window. Click 'Connect Dataset' to upload to Carto. 

![Carto](http://i.imgur.com/WvFOmy7.png)

When the data is done uploading, click 'Show me'.

### View the map

Carto automaticall detects lat/lon coordinates, gives us a basemap and plots points on the map. Pretty cool, huh? You should see something like this:

![Carto2](http://i.imgur.com/MXjICKL.png)

### Select a basemap

Carto gives you a selection of free basemaps to choose from. You can also create your own custom basemaps using tools like Mapbox and upload them to Carto. It is important to think carefully about what basemap you want to use, as it will impact to overall look, feel and utility of your map.

Click 'Positron Basemap' on the lower left-hand side of the screen ('positron' is Carto's name for its default basemap). Let's use Stamen's 'Toner Lite' basemap here. You should see this:

![Carto3](http://i.imgur.com/skGs1v8.png)

### Format the data

Our data is already in pretty good shape because it was pre-processed. However, there is one thing we need to change.

Click on 'acled-all-africa-clean' to view this layer. View the dataset by clicking on the small blue button in the lower right corner that looks like a grid. See how the 'Date' column says 'String'? This is no good... we want Carto to recognize this as a date rather than just a regular string. Change the 'Date' column to Date type, like this:

![Carto4](http://i.imgur.com/5s4G3f7.png)

### Style the data

Check out the various ways you can style your data. Carto gives you dots by default, but you can easily make heatmaps like this:

![Carto5](http://i.imgur.com/zaOMBJR.png)


And even animated maps like this:

![Carto6](https://raw.githubusercontent.com/willgeary/MappingAsianAmericasArt/master/Tutorials/Images/CongoConflictMap.gif)


For now we will stick with the dot map.








