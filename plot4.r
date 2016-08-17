#plot 4
# Set the directory(optional)
setwd("/Users/ranjeetapegu/Documents/Coursera/exploratory-data-analysis/Coursera week1")
# read the data
hpc <- read.table(file="household_power_consumption.txt", sep=";", header= TRUE,nrows=2075259,
                  check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

library(dplyr)
## Converting dates
hpc$Date<- as.Date(hpc$Date, format="%d/%m/%Y")
# filter data for first two days of feb
h <- filter(hpc, Date >= "2007-02-01" & Date <= "2007-02-02"  )
rm(hpc)
nrow(h) ## 2880

datetime = paste(h$Date, h$Time)
h$datetime<-as.POSIXct(datetime)
#plot
png(file="Plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar = c(4,4,2,2))

plot(as.numeric(h$Global_active_power)~h$datetime,type="l",ylab="Global Active Power", xlab="")
plot(as.numeric(h$Voltage)~h$datetime, type="l",ylab="Voltage", xlab="datetime")

plot(h$Sub_metering_1~h$datetime, type="l",ylab="Energy sub metering", xlab="")
lines(h$Sub_metering_2~h$datetime,col ="red")
lines(h$Sub_metering_3~h$datetime,col="blue")
legend("topright", col = c("black","red","blue"), lty=1, lwd=2, legend = c("Sub_mertering_1","Sub_metering_2","Sub_metering_3"))
plot(as.numeric(h$Global_reactive_power)~h$datetime, type="l",ylab="Global_reactive_power", xlab="")

dev.off()
