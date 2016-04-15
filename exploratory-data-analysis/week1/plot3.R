data <- read.table("exdata_data_household_power_consumption/
                   household_power_consumption.txt",
                   sep=';', header=T, nrows=2075259)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

plot3 <- function(data){
    x <- paste(as.character(data$Date), as.character(data$Time))
    x <- strptime(r, "%Y-%m-%d %H:%M:%S", tz='UTC')
    y1 <- as.numeric(as.character(data$Sub_metering_1))
    y2 <- as.numeric(as.character(data$Sub_metering_2))
    y3 <- as.numeric(as.character(data$Sub_metering_3))
    png(filename = 'plot3.png', width = 480, height = 480,
        units = 'px')
    plot(x, y1, type = 'l', ylab = "Energy sub metering")
    lines(x, y2, col = 'red')
    lines(x, y3, col = 'blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           col = c('black', 'red', 'blue'), lty=1, cex = 0.75)
    dev.off()
}

plot3(data)