## Getting dataset for two days
export.file <- file("household_power_consumption.txt")
if (!export.file %in% list.files()) {
        setwd("D:/Sokolka/R/R rogramming lessons/Exploratory Data Analyse")
        } 
column.names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electric.power <- read.table(text = grep("^[1,2]/2/2007", readLines(export.file), value = TRUE), 
                             col.names = column.names, 
                             sep=";", 
                             header = TRUE,
                             na.strings="?")
electric.power$Date <- as.Date(electric.power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(electric.power$Date), electric.power$Time)
electric.power$datetime <- as.POSIXct(datetime)

## Creating multicolor line plot
with(electric.power, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
lines(electric.power$datetime,electric.power$Sub_metering_1)
lines(electric.power$datetime,electric.power$Sub_metering_2, col="red")
lines(electric.power$datetime,electric.power$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.5)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()