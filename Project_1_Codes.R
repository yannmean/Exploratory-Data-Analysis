# read the whole dataset into R, named the dataset "home" 
# change Data and Time which are factor variables into character variables 
# paste the Data and Time variables, create new variable as datetime, and convert datetime into POSITct format
# subset the home dataset, create subset as project1 which only contains data from 2/1/2007 and 2/2/2007
home <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";")
home$Date <- as.character(home$Date)
home$Time <- as.character(home$Time)
home$datetime <- strptime(home$datetime, format = "%Y-%m-%d %H:%M:%S", tz = "")
project1 <- subset(home, Date >= "2007-02-01" & Date <= "2007-02-02")

# plot 1
hist(project1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Watts)")

# plot 2
plot(project1$datetime, project1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (watt)")

# plot 3
with(project1, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy Sub Metering"))
with(project1, points(datetime, Sub_metering_2, type = "l", col= "red"))
with(project1, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 4
with(project1, {plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") 
     plot(datetime, Voltage, type = "l")
     plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
       points(datetime, Sub_metering_2, type = "l", col = "red")
       points(datetime, Sub_metering_3, type = "l", col = "blue")
       legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(datetime, Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")})