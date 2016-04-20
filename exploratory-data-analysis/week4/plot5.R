library("ggplot2")

data <- readRDS("summarySCC_PM25.rds")
data2 <- data[data$fips == "06037",]

source_data <- readRDS("Source_Classification_Code.rds")

vehicle_sources <- grep('Vehicles$', source_data$EI.Sector)
#print(vehicle_sources)

vehicle_scc <- source_data[vehicle_sources,]$SCC
#print(vehicle_scc)

vehicle_data <- data2[as.character(data2$SCC) %in% vehicle_scc,]

plot5 <- function(d1){
    png(filename = 'plot5.png', width = 480, height = 480,
        units = 'px')
    em <- tapply(d1$Emissions, d1$year, sum, na.rm=T)
    x <- as.numeric(names(em))
    y <- as.vector(em)
    plot(x, y, pch=20, xlim=c(1998, 2009), xlab = 'Year',
         ylab = 'PM2.5  Emission', type = 'b',
         main = "Total PM2.5 emission from Vehicle sources for
         Baltimore City")
    dev.off()
}

plot5(vehicle_data)