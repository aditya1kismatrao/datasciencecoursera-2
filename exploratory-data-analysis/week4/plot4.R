library("ggplot2")

data <- readRDS("summarySCC_PM25.rds")
source_data <- readRDS("Source_Classification_Code.rds")

coal_sources <- grep('Coal$', source_data$EI.Sector)
#print(coal_sources)

coal_scc <- source_data[coal_sources,]$SCC
#print(coal_scc)

coal_data <- data[as.character(data$SCC) %in% coal_scc,]

plot4 <- function(d1){
    png(filename = 'plot4.png', width = 480, height = 480,
        units = 'px')
    em <- tapply(d1$Emissions, d1$year, sum, na.rm=T)
    x <- as.numeric(names(em))
    y <- as.vector(em)
    plot(x, y, pch=20, xlim=c(1998, 2009), xlab = 'Year',
         ylab = 'PM2.5  Emission', type = 'b',
         main = "Total PM2.5 emission from coal sources and all states")
    dev.off()
}

plot4(coal_data)