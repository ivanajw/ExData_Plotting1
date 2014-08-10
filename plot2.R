#
# Ivana Williams
# Exploratory Data Analysis
# Course Project 1
#
# plot2.R

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

# Plot 2

plot(data_sub$Global_active_power~data_sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
