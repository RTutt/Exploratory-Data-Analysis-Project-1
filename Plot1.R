setwd("C:\\Users\\rtutt\\Desktop\\Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("","#DIV/0!","NA"))
head(data)

subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off
