#Load data
powerdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?") 
# convert the date variable to Date class 
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y") 
 

# Subset the powerdata 
powerdata <- subset(powerdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02")) 

# Plot histogram
attach(powerdata) 
par(mfrow = c(1, 1)) 
hist(Global_active_power, main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", col = "Red") 

# Save graph to png file 
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
dev.off() 
detach(powerdata) 
