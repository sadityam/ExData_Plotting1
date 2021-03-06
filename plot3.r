powerdata <- read.table("household_power_consumption.txt", header = T,  sep = ";", na.strings = "?") 

# convert the date variable to Date class 
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y") 

# Subset the powerdata 
powerdata <- subset(powerdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) 

# Convert dates and times 
powerdata$datetime <- strptime(paste(powerdata$Date, powerdata$Time), "%Y-%m-%d %H:%M:%S") 

# Plot graphs
powerdata$datetime <- as.POSIXct(powerdata$datetime) 
attach(powerdata) 
par(mfrow = c(1, 1))
plot(Sub_metering_1 ~ datetime, type = "l",  
        ylab = "Energy sub metering", xlab = "") 
lines(Sub_metering_2 ~ datetime, col = "Red") 
lines(Sub_metering_3 ~ datetime, col = "Blue") 
legend("topright", lty = 1, col = c("black", "red", "blue"),  
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
 

dev.copy(png, file = "plot3.png", height = 480, width = 480) 
dev.off() 
detach(powerdata) 


