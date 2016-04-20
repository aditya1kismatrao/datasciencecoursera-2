data <- readRDS("summarySCC_PM25.rds")
balt_data <- data[data$fips == "24510",]
los_ang_data <- data[data$fips == "06037",]

source_data <- readRDS("Source_Classification_Code.rds")

vehicle_sources <- grep('Vehicles$', source_data$EI.Sector)
#print(vehicle_sources)

vehicle_scc <- source_data[vehicle_sources,]$SCC
#print(vehicle_scc)

balt_vehicle_data <- balt_data[as.character
                               (data2$SCC) %in% vehicle_scc,]
los_ang_vehicle_data <- los_ang_data[as.character
                                     (data2$SCC) %in% vehicle_scc,]


r1 <- tapply(balt_vehicle_data$Emissions,
             balt_vehicle_data$year, sum)
r2 <- tapply(los_ang_vehicle_data$Emissions,
             los_ang_vehicle_data$year, sum)

year = rep(names(r1), 2)
emission <- as.vector(c(r1, r2))
city <- c(rep("Baltimore City", 4), rep("Los Angeles County", 4))
df <- data.frame(year=year, emission=emission, city=city)

png(filename = 'plot6.png', width = 680, height = 480,
    units = 'px')

qplot(year, emission, data = df, color=city, group=city,
      xlab = "Year", ylab = "Total Emissions",
      main = "Total Emissions for Vehicle sources for Baltimore City
      and Los Angeles County") + geom_line() + geom_point()
dev.off()

