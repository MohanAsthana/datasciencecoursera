###################################################
# Make sure that the data file is in the working directory
# epc contains entire data set
epc <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?", colClasses = 
c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

epc$Date_Time <- strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")


epc$Date <- NULL
epc$Time <- NULL

#epc_2 contains 2 days of data
epc_2 <- epc[epc$Date_Time >= "2007-02-01" & epc$Date_Time < "2007-02-03" & !is.na(epc$Date_Time),]

with(epc_2, plot(Date_Time,Global_active_power, ylab="Global Active Power (kilowatts)", xlab = "",
                 cex = 0, type="o"))

dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px")
dev.off()


