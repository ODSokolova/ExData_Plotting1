## Getting dataset only for the 1st and 2d of February, 2007
export.file <- file("household_power_consumption.txt")
column.names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electric.power <- read.table(text = grep("^[1,2]/2/2007", readLines(export.file), value = TRUE), 
                            col.names = column.names, 
                            sep=";", 
                            header = TRUE,
                            na.strings="?")
## Creating Plot 1                            
png(filename="plot1.png", width=480, height=480, units="px")
hist(electric.power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
