# Clean, Read and Load data into histogram
library(dplyr)
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
sub_power <- filter(power, Date=='1/2/2007' | Date=='2/2/2007')
sub_power <- mutate(sub_power, Global_active_power=as.numeric(as.character(Global_active_power)) )

# Save into png 
png("plot1.png", width=480, height=480)
hist(sub_power$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main="Global Active Power",col="red" )
dev.off()