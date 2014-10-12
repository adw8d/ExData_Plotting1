# Read data into R
power <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
           header = TRUE,sep = ";",na.strings="?")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subset the data
data <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(power)

# Plot 1
with(data,
     hist(Global_active_power, main = "Global Active Power", 
          col = "red", xlab = "Global Active Power (kilowatts)",
          ylab = "Frequency"))

# Create png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
