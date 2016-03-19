plot3 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Subsetting only data for Baltimore city, Maryland
  baltimore <- subset(NEI, fips == "24510")
  
  ## Calculate the total emission by year and type
  baltimoreType <- with(baltimore, tapply(Emissions, list(type, year), sum, na.rm=TRUE))
  ## Turn result into a data frame
  dataFrame <- as.data.frame(as.table(twice))
  names(dataFrame) <- c("type", "year", "totalPM25")
  dataFrame$year <- as.integer(as.character(dataFrame$year))
  
  ## Plot data and save on a png format
  png("plot3.png")
  with(dataFrame, plot(year, 
                       totalPM25, 
                       col=c("black", "red", "blue", "green"), 
                       type="p", 
                       ylim=c(0,2500)))
  legend("top",
         legend=unique(dataFrame$type), 
         col=c("black", "red", "blue", "green"), 
         pch=1, 
         horiz=TRUE, 
         cex=0.8)
  dev.off()
}