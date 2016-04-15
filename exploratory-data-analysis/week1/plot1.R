data <- read.table("exdata_data_household_power_consumption/
                   household_power_consumption.txt",
                   sep=';', header=T, nrows=2075259)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

data <- data[data$Date >= '2007-02-01' & data$Date <= '2007-02-02',]

plot1 <- function(data){
    x <- as.numeric(as.character(data$Global_active_power))
    png(filename = 'plot1.png', width = 480, height = 480,
        units = 'px')
    hist(GAP, col='red', xlab = 'Global Reactive Power (kilowatts)',
         main = 'Global Reactive Power')
    dev.off()
}

plot1(data)
