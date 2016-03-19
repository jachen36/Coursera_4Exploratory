plot6 <- function(){
  ## Read data from data frame file
  NEI <- readRDS("Data/summarySCC_PM25.rds")
  SCC <- readRDS("Data/Source_Classification_Code.rds")
  
  ## Find mobile pollution's SCC
  mobileSCC <- SCC[grep("Mobile", SCC$EI.Sector),1]
  
  ## Subset Baltimore City and mobile pollution data
  mobileDataBalt <- subset(NEI, fips == "24510" & SCC %in% mobileSCC)
  ## Subset Los Angeles County and mobile pollution data
  mobileDataLA <- subset(NEI, fips == "06037" & SCC %in% mobileSCC)
  
  ## Calculate the total emission by year
  totalPM25Balt <- with(mobileDataBalt, tapply(Emissions, year, sum, na.rm=TRUE))
  totalPM25LA <- with(mobileDataLA, tapply(Emissions, year, sum, na.rm=TRUE))
  
  ## Turn result into a data frame
  dfBalt <- data.frame(year= as.integer(names(totalPM25Balt)), total = totalPM25Balt)
  dfLA <- data.frame(year= as.integer(names(totalPM25LA)), total = totalPM25LA)
  
  ## Get the range of the y axis
  min <- min(dfBalt$total)
  max <- max(dfLA$total)
  
  ## Plot data and save on a png format
  png("plot6.png")
  with(dfBalt, plot(year, 
                    total,
                    type="l",
                    col ="red",
                    ylab = "Total PM25 (ton)",
                    ylim = c(min, max),
                    main = "Total Emission From Motor Vehicle by Year"))
  with(dfLA, lines(year, 
                   total,
                   col="blue"))
  legend("topright", 
         legend=c("Batlimore City", "Los Angeles"),
         col=c("red", "blue"),
         lty=1,
         cex=0.8)
  dev.off()
}