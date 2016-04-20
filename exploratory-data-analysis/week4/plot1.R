data <- readRDS("summarySCC_PM25.rds")

plot1 <- function(d1){
    png(filename = 'plot1.png', width = 480, height = 480,
        units = 'px')
    em <- tapply(d1$Emissions, d1$year, sum, na.rm=T)
    x <- as.numeric(names(em))
    y <- as.vector(em)
    plot(x, y, pch=20, xlim=c(1998, 2009), xlab = 'Year',
         ylab = 'PM2.5  Emission', type = 'b',
         main = "Total PM2.5 emission from all sources and all states")
    dev.off()
}


plot1(data)