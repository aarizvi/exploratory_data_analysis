## Load data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, dec='.', stringsAsFactors=FALSE)

## Change date into date class
power$Date <- as.Date(power$Date, format="%m/%d/%Y")

## Subset just to 02-01-2007 and 02-02-2007
power <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02" , drop=TRUE)
datetime <- paste(as.Date(power$Date), power$Time) 
power$Datetime <- as.POSIXct(datetime)

## need to convert to numeric
power$Global_active_power <- as.numeric(power$Global_active_power)

## Second plot
png("plot2.png", width=480, height=480)
plot(power$Global_active_power~power$Datetime, type="l", ylab="Global Active Power (kiloWatts)", xlab="")
dev.off()