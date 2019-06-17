# Clean, Read and Load data into Line graph

library(dplyr)
library(lubridate)
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
sub_power <- filter(power, Date=='1/2/2007' | Date=='2/2/2007')
sub_power <- mutate(sub_power, Global_active_power=as.numeric(as.character(Global_active_power)) )
sub_power <- mutate(sub_power, DateTime= dmy_hms(paste(sub_power$Date,sub_power$Time)) )
png("plot2.png", width=480, height=480)
plot(sub_power$DateTime, sub_power$Global_active_power,type="l",xlab="" , ylab="Global Active Power (kilowatts)" , main="Global Active Power Vs Time")
dev.off()