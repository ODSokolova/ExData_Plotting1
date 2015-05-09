## Getting dataset for two days
export.file <- file("household_power_consumption.txt")
if (!export.file %in% list.files()) {
        setwd("D:/Sokolka/R/R rogramming lessons/Exploratory Data Analyse")
        } 
column.names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electric.power <- read.table(text = grep("^[1,2]/2/2007", readLines(export.file), value = TRUE), col.names = column.names, sep=";", header = TRUE, na.strings="?") 
electric.power$Date <- as.Date(electric.power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(electric.power$Date), electric.power$Time)
electric.power$datetime <- as.POSIXct(datetime)

## Creating 4 different plots
par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(electric.power, {
        plot(Global_active_power ~ datetime, type = "l", xlab = "", ylab = "Global Active Power")
        plot(Voltage ~ datetime, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy sub metering")
          lines(Sub_metering_2 ~ datetime, col = 'Red')
          lines(Sub_metering_3 ~ datetime, col = 'Blue')
          legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
        plot(Global_reactive_power ~ datetime, type = "l", xlab = "datetime", ylab = "Global_rective_power")
                     })

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()