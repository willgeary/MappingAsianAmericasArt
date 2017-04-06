## Tutorial 04 - Visualizing Networks

*Tutorial created by Will Geary (wcg2111@columbia.edu) for the Spring 2017 [Mapping for Asian/Americas Art](https://github.com/willgeary/MappingAsianAmericasArt) course at Columbia University*

This tutorial will walk through the process of creating an interactive network visualization in R. The code is based off [this tutorial](http://kateto.net/network-visualization).

### Background

Network diagrams can be helpful for visualizing relationships between people. Nodes may be used to represent individuals and edges (which can be directed or non-directed) may be used to visualize relationships.

Consider the below diagram, which visualizes relationships between twitter accounts in the "digital humanities" field. Each node represents a Twitter user, and a directed edge between node A and node B means that user A follows user B.

![Twitter Network](http://www.martingrandjean.ch/wp-content/uploads/2014/09/DigitalHumanitiesTwitterNetwork2.png)

Network visualizations can be beautiful and complex... 

![Network2](http://i.imgur.com/r7K3Ft6.png)

![Network3](http://i.imgur.com/ikPaOSt.jpg)

... but they don't have to be complicated to be interesting or useful!

This tutorial will walk through the steps of building an interactive network visualization such as:

![NetworkGif](http://i.imgur.com/jmfIK2v.gif)

### Data

We will create our own small dataset for this tutorial.

To visualize a network, you will need two separate spreadsheets. The first will contain a list of nodes, and the second will contain a list of edges.

**Dataset 1: nodes.csv**

![Nodes](http://i.imgur.com/58bjnGy.png)

**Dataset 2: edges.csv**

![Edges](http://i.imgur.com/NuoxbDT.png)

You may download these datasets below (or create your own):
https://github.com/willgeary/MappingAsianAmericasArt/tree/master/Tutorials/Data/Networks

### Visualizing in R

We will use the R programming language to create an interactive network visualization of this data. Download R here: https://www.r-project.org/. Also, download RStudio here: https://www.rstudio.com/products/rstudio/download/

The below R script will create the network visualization.

```R
nodes <- read.csv("/Users/Will/Desktop/nodes.csv", header=T, as.is=T)
edges <- read.csv("/Users/Will/Desktop/edges.csv", header=T, as.is=T)

library(tidyr)
library('visNetwork') 

nodes$shape <- "dot"  
nodes$shadow <- FALSE # Nodes will drop shadow
nodes$label <- nodes$name # Node label
nodes$borderWidth <- 2 # Node border width

nodes$color.border <- "black"
nodes$color.highlight.background <- "orange"
nodes$color.highlight.border <- "darkred"

edges$color <- "gray"    # line color  
edges$arrows <- "middle" # arrows: 'from', 'to', or 'middle'
edges$smooth <- TRUE    # should the edges be curved?
edges$shadow <- FALSE    # edge shadow

v <- visNetwork(nodes, edges) %>%
  visOptions(highlightNearest = TRUE, 
             selectedBy = "label") %>%
  visLegend()

v
```

![NetworkGif](http://i.imgur.com/jmfIK2v.gif)

You can easily export the network to html and embed on a website using the htmlwidgets package.

```R
library(htmlwidgets)
htmlwidgets::saveWidget(v, "visnetwork.html")
```

Here is the live widget in html:

https://willgeary.github.io/NetworkVisualization/



