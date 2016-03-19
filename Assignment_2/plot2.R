plot2 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Subsetting only data for Baltimore city, Maryland
  baltimore <- subset(NEI, fips == "24510")
  ## Calculate the total emission by year
  totalPM25 <- with(baltimore, tapply(Emissions, year, sum, na.rm=TRUE))
  ## Turn result into a data frame
  dataFrame <- data.frame(year=as.integer(names(totalPM25)), total = totalPM25)
  
  ## Plot data and save on a png format
  png("plot2.png")
  with(dataFrame, plot(year, 
                       total, 
                       ylab="total PM2.5", 
                       main="Total Emission for Baltimore City, Maryland"))
  dev.off()
}