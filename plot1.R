#Plotting Assignment 1 for Exploratory Data Analysis
#This assignment uses data from the UC Irvine Machine Learning Repository,
#a popular repository for machine learning datasets. In particular,
#we will be using the "Individual household electric power consumption Data Set"
df.hpc.in <- read.table("household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?"  )

two.days <- subset(df.hpc.in, Date == "1/2/2007" | Date == "2/2/2007" )
two.days$Date <- as.Date(two.days$Date)

hist(two.days$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.copy(png, file = "figure/plot1.png")
dev.off()

