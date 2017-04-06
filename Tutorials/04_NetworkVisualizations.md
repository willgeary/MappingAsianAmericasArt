## Tutorial 04 - Visualzing Networks

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

You may download these datasets here:

### Visualizing in R

Below is an R script that will create an interactive network visualization of this data. You can easily export the network to html and embed on a website.

`
nodes <- read.csv("/Users/Will/Desktop/nodes.csv",
                  header=T, as.is=T)

edges <- read.csv("/Users/Will/Desktop/edges.csv",
                  header=T, as.is=T)
`


