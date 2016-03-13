## Make plot 1
plot1 <- function(df){
  ## Open graphic device png
  png("plot1.png")
  with(df, hist(Global_active_power, 
                col="red", 
                xlab="Global Active Power (kilowatts)", 
                ylab="Frequency", 
                main="Global Active Power"))
  ## Close and save png graphic device
  dev.off()
}