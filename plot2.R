## Getting full dataset
export.file <- file("household_power_consumption.txt")
if (!export.file %in% list.files()) {
        setwd("~/R/R rogramming lessons/Exploratory Data Analyse")
        } 
column.names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
electric.power <- read.table(export.file, col.names = column.names, sep=";", header = TRUE, na.strings="?")
electric.power$Date <- as.Date(electric.power$Date, format = "%d/%m/%Y")
## Subsetting data for two days
ep.data <- subset(electric.power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(electric.power)
## Converting dates to needed format
datetime <- paste(as.Date(ep.data$Date), ep.data$Time)
ep.data$datetime <- as.POSIXct(datetime)
## Creating line lot
plot(ep.data$Global_active_power~ep.data$datetime,type="l",xlab="",ylab="Global active power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
