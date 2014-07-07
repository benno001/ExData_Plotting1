# Read data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert date strings to date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data from 2007-02-01 and 2007-02-02
data.sub <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# Convert time strings to time
data.sub$DateTime <- as.POSIXct(paste(data.sub$Date, data.sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Create rows and colums
par(mfrow = c(2,2))

# Create plot 1,1
plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab="", data = data.sub)

# Create plot 2,1
plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime", data = data.sub)

# Create plot 1,2
plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab="", data = data.sub)
lines(Sub_metering_2 ~ DateTime, col = "red", type = "l", data = data.sub)
lines(Sub_metering_3 ~ DateTime, col = "blue", type = "l", data = data.sub)

# Create legend for plot 1,2
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, lwd = 1)

# Create plot 2,2
plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime", data = data.sub)

# Create png
dev.copy(png, file = "plot4.png")
dev.off()
