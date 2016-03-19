plot5 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Find mobile pollution's SCC
  mobileSCC <- SCC[grep("Mobile", SCC$EI.Sector),1]
  
  ## Subset Baltimore City and mobile pollution data
  mobileData <- subset(NEI, fips == "24510" & SCC %in% mobileSCC)
  
  ## Calculate the total emission by year
  totalPM25 <- with(mobileData, tapply(Emissions, year, sum, na.rm=TRUE))
  ## Turn result into a data frame
  dataFrame <- data.frame(year= as.integer(names(totalPM25)), total = totalPM25)
  
  ## Plot data and save on a png format
  png("plot5.png")
  with(dataFrame, plot(year, 
                       total,
                       type="l",
                       ylab = "Total PM25 (ton)",
                       main = "Total Emission From Motor Vehicle in Baltimore City"))
  dev.off()
}