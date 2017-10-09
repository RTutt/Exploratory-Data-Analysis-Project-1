setwd("C:\\Users\\rtutt\\Desktop\\Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("","#DIV/0!","NA"))
head(data)

subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$datetime <- as.POSIXct(subdata$datetime)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

with(subdata, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = ""))

with(subdata, plot(Voltage ~ datetime, type = "l"))

with(subdata, plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(subdata, lines(Sub_metering_2 ~ datetime, col = "Red"))
with(subdata, lines(Sub_metering_3 ~ datetime, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))   

with(subdata, plot(Global_reactive_power ~ datetime, type = "l"))
dev.off()
