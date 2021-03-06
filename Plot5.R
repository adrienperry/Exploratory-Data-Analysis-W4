NEI <- readRDS("summarySCC_PM25.rds”)
SCC <- readRDS("Source_Classification_Code.rds")
data <- subset(SCC,grepl("*Vehicles",SCC.Level.Two)==TRUE)
dfvehicles <- subset(NEI,NEI$SCC %in% data$SCC)
dfvehicles2 <- subset(dfvehicles, dfvehicles$fips=="24510”)
df5 <- tapply(dfvehicles2$Emissions,dfvehicles2$year,sum)
png("Plot5.png",width = 480, height = 480, units = "px")
plot(names(df5),df5,xlab = "Year",ylab = "Total PM2.5 Emissions for Motor vehicles in Baltimore")
dev.off()
