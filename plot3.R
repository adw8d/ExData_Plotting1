# Read data into R
power <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                    header = TRUE,sep = ";",na.strings="?")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subset the data
data <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power)

# Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
png(file="plot3.png", height=480, width=480)

par(col = "black")
with(data,
     plot(Datetime,Sub_metering_1,type="n",xlab="",ylab = "Energy sub metering",col="black"))
with(data,
     points(Datetime,Sub_metering_1,type="l",col="black"))
with(data,
     points(Datetime,Sub_metering_2,type="l",col="red"))
with(data,
     points(Datetime,Sub_metering_3,type="l",col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()