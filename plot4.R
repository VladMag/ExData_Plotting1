# loading data
dtDataSet <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filtering data
dtDataSetFiltered <- subset( dtDataSet, Date %in% c("1/2/2007","2/2/2007") )

# merging the Date and Time variables into a single variable
dtDataSetFiltered$DataTime <- strptime( paste( dtDataSetFiltered$Date, dtDataSetFiltered$Time ) , format="%d/%m/%Y %H:%M:%S" )

# setting up the active graphics device
png( filename="plot4.png", width = 480, height = 480 )

# configuring multiple plots
par( mfrow=c(2,2) )

# making a plot-1
with( dtDataSetFiltered , 
      plot( DataTime , Global_active_power , ylab="Global Active Power" , xlab="" , type="l" )
)

# making a plot-2
with( dtDataSetFiltered , 
      plot( DataTime , Voltage , ylab="Voltage" , xlab="datetime" , type="l" )
)

# making a plot-3 (in three steps)
with( dtDataSetFiltered , 
      plot( DataTime , Sub_metering_1 , ylab="Energy sub metering" , xlab="" , type="l" )
      )

with( dtDataSetFiltered , 
      points( DataTime , Sub_metering_2 , type="l" , col="red" )
      )

with( dtDataSetFiltered , 
      points( DataTime , Sub_metering_3 , type="l" , col="blue" )
      )

legend( "topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"), bty="n" )

# making a plot-4
with( dtDataSetFiltered , 
      plot( DataTime , Global_reactive_power , xlab="datetime" , type="l" )
)

# shutting down the current graphics device
dev.off()
