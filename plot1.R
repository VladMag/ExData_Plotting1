# loading data
dtDataSet <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# filtering data
dtDataSetFiltered <- subset( dtDataSet, Date %in% c("1/2/2007","2/2/2007") )

# setting up the active graphics device
png( filename="plot1.png", width = 480, height = 480 )

# making a histogram plot
with( dtDataSetFiltered , 
      hist( Global_active_power, col="red", main="Global Active Power",
            xlab="Global Active Power (kilowatts)"
            )
      )

# shutting down the current graphics device
dev.off()
