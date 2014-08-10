#
# Ivana Williams
# Exploratory Data Analysis
# Course Project 1
#
# plot4.R

# Set working directory

setwd("C:/Users/Ivana/Desktop/expl data science/")

# Import data

data <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

data_sub <- data.frame(data_sub)

# Convert dates

date_sub_new <- paste(as.Date(data_sub$Date), data_sub$Time)

data_sub$Datetime <- as.POSIXct(date_sub_new)

# Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,2,0,0))

with(data_sub, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage" , xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty= 1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
