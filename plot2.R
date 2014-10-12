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

# Plot 2
par(col = "black")
with(data,
     plot(Datetime,Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)",col="black"))

# Create png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
