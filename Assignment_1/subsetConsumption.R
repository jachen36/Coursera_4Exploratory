
## Function subset household_power_consumption.txt
## for data from 2/1 to 2/2/2007
subsetConsumption <- function(){
  file <- "household_power_consumption.txt"
  ## Find the location of the data of interest
  data_index <- grep("^[12]/2/2007", readLines(file))
  ## Extract the column titles
  headers <- strsplit(readLines(file, 1), ";")
  ## Read only the data of interest
  df <- read.table(file, header=FALSE, sep=";", as.is=TRUE,
                   col.names = headers[[1]],
                   skip = data_index[1]-1, 
                   nrows= length(data_index))
  ## Combine date and time and convert into into date time class
  date_time <- strptime(paste(df$Date, df$Time), 
                        format="%d/%m/%Y %H:%M:%S")
  ## date_time to the data frame
  df <- cbind(date_time, df)
}

