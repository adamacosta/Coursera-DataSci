NFL Season Visualizer
========================================================
author: Adam Acosta
date: June 20th, 2015


Purpose of the App
========================================================

This application allows the user to build a force-directed
network model of several NFL seasons. It serves as a companion
to a modeling report building a Super Bowl odds predictor 
from such a network model.

The full report can be found [here](http://rpubs.com/adamacosta/nflmodel)

Building the prediction model requires visualizing a season 
as a directed graph with edges between teams that played each 
other, weighted by the cumulative margin of victory across all 
games.


Why Shiny Apps?
========================================================

Shiny Apps allows the use of the networkD3 library, which 
otherwise cannot run in an Rmarkdown pdf file, making it 
more difficult to understand the model. The application is 
currently very bare-bones, but could also be extended in the 
future to contain a server-side version of the prediction 
model itself, allowing a user to upload future seasons and 
get the predicted odds back for each team. It could also be 
updated automatically each week during a season to generate 
new odds on a week-by-week basis, similar to the way the 
Sagarin ratings themselves work. 


Building the Model
========================================================



The odds model itself is a simple logistic regression model, 
$P(Y=1) = \frac{1}{1 + e^{4 - 0.0064 x}}$ , illustrated by the following plot:

![plot of chunk unnamed-chunk-2](finpres-figure/unnamed-chunk-2-1.png) 


Where To Go From Here
========================================================

Both the application and the model are currently very basic.
Aside from embedding the predictive model itself in the application,
further improvements could be made by allowing an interactive 
interface showing the box scores from the season, and allowing 
the building of regression based upon different stats, rather than 
just the margin of victory. 

