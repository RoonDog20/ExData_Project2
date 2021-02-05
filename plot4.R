## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

coal_sources <- SCC[grep(".*Comb.*Coal.*", SCC$EI.Sector),]
coal_sccs    <- coal_sources$SCC
coal_data    <- subset(NEI, SCC %in% coal_sccs)

sums  <- with(coal_data, tapply(Emissions, year, sum, na.rm = TRUE))
years <- names(sums)

plot(years, sums, 
     type="b", col="purple", pch = 19, lwd = 2, xaxt="n",
     ylab="Total Emitted Pollution (Tons)", 
     xlab="Year", 
     main="Total Emitted Pollution by Year from Coal Combustion in the U.S.")
axis(side = 1, at = years)
