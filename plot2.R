# loading data
dtDataSet <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filtering data
dtDataSetFiltered <- subset( dtDataSet, Date %in% c("1/2/2007","2/2/2007") )

# merging the Date and Time variables into a single variable
dtDataSetFiltered$DataTime <- strptime( paste( dtDataSetFiltered$Date, dtDataSetFiltered$Time ) , format="%d/%m/%Y %H:%M:%S" )

# setting up the active graphics device
png( filename="plot2.png", width = 480, height = 480 )

# making a line plot
with( dtDataSetFiltered , 
      plot( DataTime , Global_active_power , ylab="Global Active Power (kilowatts)" , xlab="" , type="l" )
      )

# shutting down the current graphics device
dev.off()
