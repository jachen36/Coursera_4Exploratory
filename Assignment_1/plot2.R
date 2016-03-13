## Make plot 2
plot2 <- function(df){
  ## Open graphic device png
  png("plot2.png")
  with(df, plot(date_time, 
                Global_active_power, 
                type="l",
                ylab="Global Active Power (kilowatts)",
                xlab=""))
  ## Close and save png graphic device
  dev.off()
}