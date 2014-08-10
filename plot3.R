#
# Ivana Williams
# Exploratory Data Analysis
# Course Project 1
#
# plot3.R

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

# Plot 3
par(mar = c(5, 5, 5, 5))


with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright",  lty = 1, lwd = 2,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7, trace= TRUE)


dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()
