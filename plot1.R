# Read data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert date strings to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02
data.sub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-01",]
