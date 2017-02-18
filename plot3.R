# loading data
dtDataSet <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filtering data
dtDataSetFiltered <- subset( dtDataSet, Date %in% c("1/2/2007","2/2/2007") )

# merging the Date and Time variables into a single variable
dtDataSetFiltered$DataTime <- strptime( paste( dtDataSetFiltered$Date, dtDataSetFiltered$Time ) , format="%d/%m/%Y %H:%M:%S" )

# setting up the active graphics device
png( filename="plot3.png", width = 480, height = 480 )

# making a line plot in three steps
with( dtDataSetFiltered , 
      plot( DataTime , Sub_metering_1 , ylab="Energy sub metering" , xlab="" , type="l" )
      )

with( dtDataSetFiltered , 
      points( DataTime , Sub_metering_2 , type="l" , col="red" )
      )

with( dtDataSetFiltered , 
      points( DataTime , Sub_metering_3 , type="l" , col="blue" )
      )

# creating a plot legend
legend( "topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue")   )

# shutting down the current graphics device
dev.off()
