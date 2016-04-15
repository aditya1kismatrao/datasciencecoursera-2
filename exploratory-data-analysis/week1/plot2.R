data <- read.table("exdata_data_household_power_consumption/
                   household_power_consumption.txt",
                   sep=';', header=T, nrows=2075259)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

plot2 <- function(data){
    x <- paste(as.character(data$Date), as.character(data$Time))
    x <- strptime(r, "%Y-%m-%d %H:%M:%S", tz='UTC')
    y <- as.numeric(as.character(data$Global_active_power))
    png(filename = 'plot2.png', width = 480, height = 480,
        units = 'px')
    plot(x, y, type = 'l', ylab = 'Global Reactive Power (kilowatts)')
    dev.off()
}

plot2(data)