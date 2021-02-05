## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
sums      <- with(baltimore, tapply(Emissions, year, sum, na.rm = TRUE))
sums      <- sums / 1e3
years     <- names(sums)

plot(years, sums, 
     type="b", col="red", pch = 19, lwd = 2, xaxt="n",
     ylab="Total Emitted Pollution in Baltimore (1K Tons)", 
     xlab="Year", 
     main="Total Emitted Pollution by Year in Baltimore")
axis(side = 1, at = years)