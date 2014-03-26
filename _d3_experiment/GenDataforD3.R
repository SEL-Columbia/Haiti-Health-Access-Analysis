pop_with_health <- read.csv("data/Population_with_Health_utm.csv")

require(sp); require(rgdal)
wgs84 <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
utm <- CRS("+proj=utm +zone=18 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")


# just transform the population x / y, health is already transformed
coordinates(pop_with_health) <- ~x.pop+y.pop
proj4string(pop_with_health) <- utm
pop_with_health_sp <- spTransform(pop_with_health, wgs84)

pop_with_health_out <- data.frame(pop_with_health_sp)
pop_with_health_out <- pop_with_health_out[c("hID", "X2003_pop_estimates","Categorie",
                                             "longitude", "latitude", "pID", "x.pop", "y.pop")]
names(pop_with_health_out) <- c("hID", "Population", "Categorie",
                                "long_h", "lat_h", "pID", "long_pop", "lat_pop")
write.csv(pop_with_health_out, "data/Population_with_Health_wgs.csv")


######## annoying approach
# pop_health_spliced <- read.csv("data/Population_Health_Spliced_utm.csv")
# 
# require(sp)
# require(plyr)
# require(rgdal)
# require(ggplot2)
# 
# 
# sl <- dlply(pop_health_spliced, .(group), function(df) { 
#   Lines(Line(df[c('x','y')]), ID=df[1,'pID'])
# })
# 
# sldf <- SpatialLinesDataFrame(SpatialLines(sl, proj4string=utm),
#                               data=pop_health_spliced[c("pID", "Population", "Population.Bin")])
# sldfT <- spTransform(sldf, wgs84)
# write.csv(fortify(sldfT), "data/Pouplation_Health_Spliced_wgs84.csv")