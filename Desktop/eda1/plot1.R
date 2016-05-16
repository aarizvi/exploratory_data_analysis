## Load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec='.', stringsAsFactors=FALSE)

## Change date into date class
power$Date <- as.Date(power$Date, format="%m/%d/%Y")

## Subset just to 02-01-2007 and 02-02-2007
power <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02" , drop=TRUE)
datetime <- paste(as.Date(power$Date), power$Time) 
power$Datetime <- as.POSIXct(datetime)


power$Global_active_power <- as.numeric(power$Global_active_power)



#plot histogram
png("plot1.png", width=480, height=480)
hist(power$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kiloWatts)",
     ylab="Frequency",
     xlim=c(0,6),
     ylim=c(0,1200))
dev.off()
