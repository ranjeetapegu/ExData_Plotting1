#plot1.R
# Set the directory
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
png(file="Plot3.png", width=480, height=480)
hist(as.numeric(h$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
