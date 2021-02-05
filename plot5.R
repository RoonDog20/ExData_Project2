## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
sums      <- with(baltimore, tapply(Emissions, year, sum, na.rm = TRUE))
years     <- names(sums)

plot(years, sums, 
     type="b", col="blue", pch = 19, lwd = 2, xaxt="n",
     ylab="Motor Vehicle Emissions (Tons)", 
     xlab="Year", 
     main="Total Emitted Pollution by Year in Baltimore for Motor Vehicles")
axis(side = 1, at = years)