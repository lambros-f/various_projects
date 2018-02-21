#This is a script to generate an rugged landscape for the small figure in the commentary
#It is based on the volcano dataset

library(reshape2) # for melt
volcano3d <- melt(volcano)
names(volcano3d) <- c("x", "y", "z")

# Basic plot
ggplot(volcano3d, aes(x, y, z = z))
v + geom_tile(aes(fill = z)) + stat_contour()

persp(volcano, theta=40, phi=30, expand=0.5, col="gray")
persp(volcano, theta = 40, phi = 40, col = "gray", border = NA, shade = 0.5, box = T)
persp(quakes, theta=40, phi=30, expand=0.5, col="gray")

volc2 <-  volcano[sample(nrow(volcano)),]
volc2 <-  volc2[sample(ncol(volc2)),ncol(volc2))]
persp(volc2, theta=40, phi=30, expand=0.5, col="gray")

library(maptools)
library(raster)
alt <- getData('alt', country='GR')
adm <- getData('GADM', country='GR', level=1)
adm$NAME_1
mar<-(adm[adm$NAME_1=='Thessaly and Central Greece',])
maralt<-crop(alt,mar)
persp(maralt, exp=0.2,phi=35, Thessaly and Central Greece)

alt <- getData('alt', country='DE')
adm <- getData('GADM', country='DE', level=1)
mar<-(adm[adm$NAME_1=='Nordrhein-Westfalen',])
maralt<-crop(alt,mar)
persp(maralt, exp=0.2,phi=35, xlab='Longitude', ylab='Latitude', zlab='Elevation')

persp(volcano, 
      theta=30, 
      phi=40, 
      expand=0.3, 
      col="aliceblue", 
      shade = 0.1,
      border = NA,
      r=1.9,
      xlab='Selection Dimention 2', ylab='Selection Dimension 1', zlab='Fitness')

persp(volcano, 
      theta=30, 
      phi=40, 
      expand=0.3, 
      col="aliceblue", 
      shade = 0.1,
      border = NA,
      r=1.9,
      xlab='Selection Dimention 2', ylab='Selection Dimension 1', zlab='Fitness')

