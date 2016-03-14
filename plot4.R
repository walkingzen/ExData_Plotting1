#Plotting Assignment 1 for Exploratory Data Analysis
#This assignment uses data from the UC Irvine Machine Learning Repository,
#a popular repository for machine learning datasets. In particular,
#we will be using the "Individual household electric power consumption Data Set"
df.hpc.in <- read.table("household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?"  )

two.days <- subset(df.hpc.in, Date == "1/2/2007" | Date == "2/2/2007" )
two.days$Date <- strptime(two.days$Date, "%e/%m/%Y")
two.days$Date <- as.Date(two.days$Date)
two.days$DateTime <- as.POSIXct(paste(two.days$Date, two.days$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

#plotting Global Active Power
plot(two.days$DateTime, two.days$Global_active_power,
     xlab = "Hours of Day",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

#plotting Voltage
plot(two.days$DateTime, two.days$Voltage,
     xlab = "Hours of Day",
     ylab = "Voltage",
     type = "l")

#plotting sub metering
plot(two.days$DateTime, two.days$Sub_metering_1,
     xlab = "Hours of Day",
     ylab = "Energy sub metering",
     type = "l")
lines(two.days$DateTime, two.days$Sub_metering_2, col = "red")
lines(two.days$DateTime, two.days$Sub_metering_3, col = "blue")
legend("topright",
       lty =  1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plotting global reactive power

plot(two.days$DateTime, two.days$Global_reactive_power,
     xlab = "Hours of Day",
     ylab = "Global reactive power",
     type = "l")

dev.copy(png, file = "figure/plot4.png")
dev.off()
#
