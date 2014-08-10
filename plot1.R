#
# Ivana Williams
# Exploratory Data Analysis
# Course Project 1
#
# plot1.R

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

# Plot 1

hist(data_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))

hist(data_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

dev.off()
