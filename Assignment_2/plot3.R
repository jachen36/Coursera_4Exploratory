library(ggplot2)

plot3 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Subsetting only data for Baltimore city, Maryland
  baltimore <- subset(NEI, fips == "24510")
  
  ## Calculate the total emission by year and type
  baltimoreType <- with(baltimore, tapply(Emissions, list(type, year), sum, na.rm=TRUE))
  ## Turn result into a data frame
  dataFrame <- as.data.frame(as.table(baltimoreType))
  names(dataFrame) <- c("type", "year", "totalPM25")
  dataFrame$year <- as.integer(as.character(dataFrame$year))
  
  ## Plot data and save on a png format
  qplot(year, 
        totalPM25, 
        data=dataFrame, 
        colour = type, 
        geom="path",
        ylab = "Total PM2.5 (Ton)",
        main="Baltimore City Type of Pollution")
  ggsave(file="plot3.png")
}