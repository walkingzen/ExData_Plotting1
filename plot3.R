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

dev.copy(png, file = "figure/plot3.png")
dev.off()
#
