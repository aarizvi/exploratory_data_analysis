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


## plot sub meter time series
png("plot3.png", width=480, height=480)
plot(power$Datetime, power$Sub_metering_1,
     type="l",
     ylab="Energy Submetering",
     xlab="",
     ylim=c(0,30))
lines(power$Datetime,power$Sub_metering_2,
      col='Red')
lines(power$Datetime,power$Sub_metering_3,
      col='Blue')
legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()