NEI <- readRDS("summarySCC_PM25.rds”)
SCC <- readRDS("Source_Classification_Code.rds")
data <- subset(SCC,grepl("*Vehicles",SCC.Level.Two)==TRUE)
dfvehicles <- subset(NEI,NEI$SCC %in% data$SCC)
dataframecity <- subset(dfvehicles,(dfvehicles$fips=="24510" | dfvehicles$fips=="06037") & (dfvehicles$year>2007 | dfvehicles$year<2000))
dataagg <- aggregate(dataframecity$Emissions,by=list(dataframecity$fips,dataframecity$year),FUN=sum)
names(dataagg)<- c("City","Year","Total Emissions”)
dataagg[dataagg=="06037"]<-"Los Angeles County”
dataagg[dataagg=="24510"]<-"Baltimore City”
png("Plot6.png",width = 480, height = 480, units = "px")
library(ggplot2)
ggplot(data = dataagg,aes(x=Year,y=`Total Emissions`))+geom_line(aes(linetype=City))
dev.off()
