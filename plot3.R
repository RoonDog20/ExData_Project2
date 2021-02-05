library("dplyr")
library("ggplot2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510")
type_data <- baltimore %>%
             group_by(year, type) %>%
             summarise(total = sum(Emissions))
my_plot   <- ggplot(pivot, aes(x = year, y = total, 
                  color = type, group = type)) +
             geom_point() + 
             geom_line() +
             labs(x = "Year", y = "Emissions (Tons)", 
                  title = "Emissions by Year for Each Type")