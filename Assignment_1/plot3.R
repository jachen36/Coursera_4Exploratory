## Make plot 3
plot3 <- function(df){
  ## Open graphic device png
  png("plot3.png")
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
         col =c("black", "red", "blue"))
  ## Close and save png graphic device
  dev.off()
}