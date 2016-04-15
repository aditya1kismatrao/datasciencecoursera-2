data <- read.table("exdata_data_household_power_consumption/
                   household_power_consumption.txt",
                   sep=';', header=T, nrows=2075259)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

plot4 <- function(data){
    
    png(filename = 'plot4.png', width = 480, height = 480,
        units = 'px')
    
    x <- paste(as.character(data$Date), as.character(data$Time))
    x <- strptime(r, "%Y-%m-%d %H:%M:%S", tz='UTC')
    
    par(mfrow = c(2,2))
    
    y <- as.numeric(as.character(data$Global_active_power))
    plot(x, y, type = 'l', ylab = 'Global Reactive Power (kilowatts)')
    
    y <- as.numeric(as.character(data$Voltage))
    plot(x, y, type = 'l', ylab = 'Voltage', xlab = 'datetime')
    
    y1 <- as.numeric(as.character(data$Sub_metering_1))
    y2 <- as.numeric(as.character(data$Sub_metering_2))
    y3 <- as.numeric(as.character(data$Sub_metering_3))
    plot(x, y1, type = 'l', ylab = "Energy sub metering")
    lines(x, y2, col = 'red')
    lines(x, y3, col = 'blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), lty=1, cex = 0.70)
    
    y <- as.numeric(as.character(data$Global_reactive_power))
    plot(x, y, type = 'l', ylab = "Global_reactive_power",
         xlab = 'datetime')
    
    dev.off()
}

plot4(data)

plot4(data)