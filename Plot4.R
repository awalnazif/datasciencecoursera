## Loading the already downloaded dataset using read.table
raw<- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
## Subsetting the rows corresponding to 2007-02-01 and 2007-02-02
data<- subset(x = raw, subset = Date == "1/2/2007" | Date == "2/2/2007")
## Changing the column classes of the variables
data$Date<-as.Date(x = data$Date, format = "%d/%m/%Y")
data$Global_active_power<- as.numeric(x = data$Global_active_power)
data$Global_reactive_power<- as.numeric(x = data$Global_reactive_power)
data$Voltage<- as.numeric(x = data$Voltage)
data$Global_intensity<- as.numeric(x = data$Global_intensity)
data$Sub_metering_1<- as.numeric(x = data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(x = data$Sub_metering_2)
## Ploting the Graphs
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data = data, expr = plot(x = Date, y = Global_active_power, ylab = "Global Active Power"))
with(data = data, expr = plot(x = Date, y = Voltage, ylab = "Voltage"))
with(data = data, expr = plot(x = Date, y = Sub_metering_1, ylab = "Energy Sub Metering"))
with(data = data, expr = points(x = Date, y = Sub_metering_2, col ="red" ))
with(data = data, expr = points(x = Date, y = Sub_metering_3, col ="blue" ))
legend("topright", pch = 1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
with(data = data, expr = plot(x = Date, y = Global_reactive_power, ylab = "Global Reactive Power"))
dev.off()
