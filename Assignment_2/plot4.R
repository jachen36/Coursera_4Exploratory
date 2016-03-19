library(ggplot2)

plot4 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Coal burning only
  coalSCC <- SCC[grep("Coal", SCC$EI.Sector), 1]
  ## Subset coaling burning emissions only
  coalData <- subset(NEI, SCC %in% coalSCC)
  
  ## Calculate the total emission by year
  totalPM25 <- with(coalData, tapply(Emissions, year, sum, na.rm=TRUE))
  ## Turn result into a data frame
  dataFrame <- data.frame(year= as.integer(names(totalPM25)), total = totalPM25)
  
  ## Plot data and save on a png format
  q <- qplot(year, 
        total, 
        data=dataFrame, 
        geom=c("point", "path"),
        ylab= "TotalPM2.5(ton)",
        main="Coal Combustion-Related Source")
  ggsave(file="plot4.png")
}