library("dplyr")
library("ggplot2")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")

get_city_name <- function(fips = '00000') {
  if (fips == "24510") {
    "Baltimore"
  }
  else if (fips == '06037') {
    "Los Angeles"
  }
  else {
    "Not Baltimore or Los Angeles"
  }
}

balt_and_la <- subset(NEI, (fips == "24510" | fips == "06037") & 
                            type == "ON-ROAD")

type_data <- balt_and_la %>%
  group_by(year, fips) %>%
  summarise(total = sum(Emissions))
my_plot   <- ggplot(type_data, aes(x = year, y = total, 
                               color = fips, group = fips)) +
  geom_point() + 
  geom_line() +
  labs(x = "Year", y = "Emissions (Tons)", 
       title = "Emissions by Year for Each Type")