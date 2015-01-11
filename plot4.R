## Assignment 1 (plot 4)
## Exploratory Data Analysis (coursera)
## T.M. January 2015

library(gplots)
## data from the dates 2007-02-01 and 2007-02-02
DATES <- as.Date(c("2007-02-01","2007-02-02"))
## make sure this file is in your working folder!
file.input <- "household_power_consumption.txt"

## upload the first column only (dates)
columns.mask = c("character",rep("NULL",8))
energy.dates <- read.table(file.input, 
                           sep = ";", 
                           header = TRUE, 
                           colClasses = columns.mask)
energy.dates <- as.Date(energy.dates[,1],format = "%d/%m/%Y")
row.numbers = 1:length(energy.dates)
choose.rows <- row.numbers[which(energy.dates==DATES[1] | 
                                   energy.dates==DATES[2])]
energy.data <- read.table(file.input, sep = ";", 
                           skip = choose.rows[1],
                           nrows = length(choose.rows))
data.names <- read.table(file.input, sep = ";", nrows = 1)
time.data <- paste(energy.data[,1], energy.data[,2])
time.data <- strptime(time.data, "%d/%m/%Y %H:%M:%S")


png(filename="plot4.png")
par(mfrow = c(2,2))
## upper left plot
plot(time.data,energy.data[,3], col = "black",
     type = "l", lwd = 1,
     ylab = "Global Active Power",
     xlab = "")
## upper right plot
plot(time.data,energy.data[,5], col = "black",
     type = "l", lwd = 1,
     ylab = "Voltage",
     xlab = "datetime")
## lower left plot
yrange<-range(c(energy.data[,7:9]))
plot(time.data,energy.data[,7], col = "black",
     ylim = yrange,
     type = "l", lwd = 1,
     ylab = "Energy sub metering",
     xlab = "")
par(new = T)
plot(time.data,energy.data[,8], col = "red",
     type = "l", lwd = 1,
     axes = F, ylim = yrange, ylab = "", xlab = "")
par(new = T)
plot(time.data,energy.data[,9], col = "blue",
     type = "l", lwd = 1,
     axes = F, ylim = yrange, ylab = "", xlab = "")
smartlegend("right","top",legend = c(as.character(data.names[1,7]),
                            as.character(data.names[1,8]),
                            as.character(data.names[1,9])),
            col = c("black","red","blue"), lty = 1, inset = 0,
            bty = "n")
par(new = F)
## lower right plot
plot(time.data,energy.data[,4], col = "black",
     type = "l", lwd = 1,
     ylab = as.character(data.names[1,4]),
     xlab = "datetime")

dev.off()
