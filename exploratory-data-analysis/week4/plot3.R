library("ggplot2")

data <- readRDS("summarySCC_PM25.rds")
data2 <- data[data$fips == "24510",]

plot3 <- function(data){
    data <- split(data, data$type)
    data <- sapply(data, 
                   function(x) tapply(x$Emissions, x$year, sum))
    
    year <- rep(as.vector(rownames(data)), 4)
    emission <- c(data)
    type <- c()
    for (x in colnames(data)){
        type <- c(type, rep(x, 4))
    }
    df <- data.frame(year=year, emission=emission, type=type)
    
    png(filename = 'plot3.png', width = 680, height = 480,
        units = 'px')
    
    qplot(year, Emissions, data = df, color=type, group=type,
          xlab = "Year", ylab = "Total Emissions",
          main = "Total Emissions for Baltimore City grouped
           by different sources") + geom_line() + geom_point()
    dev.off()
}

plot3(data2)
