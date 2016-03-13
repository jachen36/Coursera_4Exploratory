## Make plot 4
plot4 <- function(df){
  ## Open graphic device png
  png("plot4.png")
  ## Make a frame that holds 4 graphs
  par(mfrow=c(2,2))
  ## Add first graph
  with(df, plot(date_time, 
                Global_active_power, 
                type="l",
                ylab="Global Active Power (kilowatts)",
                xlab=""))
  ## Add second graph
  with(df, plot(date_time, Voltage, type="l"))
  ## Add third graph
  with(df, plot(date_time, 
                Sub_metering_1, 
                type="l",
                ylab="Energy sub metering",
                xlab=""))
  ## Add second line
  with(df, lines(date_time, Sub_metering_2, col="red"))
  ## Add third line
  with(df, lines(date_time, Sub_metering_3, col="blue"))
  legend("topright", 
         legend=c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"),
         lty=1,
         col =c("black", "red", "blue"),
         bty="n")
  ## Add fourth graph
  with(df, plot(date_time, Global_reactive_power, type="l"))
  ## Close and save png graphic device
  dev.off()
}