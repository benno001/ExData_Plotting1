# Read data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert date strings to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02
data.sub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Convert time strings to time
data.sub$DateTime <- as.POSIXct(paste(data.sub$Date, data.sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Create plot
plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab="", data = data.sub)
lines(Sub_metering_2 ~ DateTime, col = "red", type = "l", data = data.sub)
lines(Sub_metering_3 ~ DateTime, col = "blue", type = "l", data = data.sub)

# Create legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, lwd = 1)

# Create png
dev.copy(png, file = "plot3.png")
dev.off()
