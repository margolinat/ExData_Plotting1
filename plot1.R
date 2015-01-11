## Assignment 1 (plot 1)
## Exploratory Data Analysis (coursera)
## T.M. January 2015

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
choose.rows <- row.numbers[which(energy.dates==DATES[1] | energy.dates==DATES[2])]
energy.data <- read.table(file.input, sep = ";", 
                           skip = choose.rows[1],
                           nrows = length(choose.rows))
png(filename="plot1.png")
hist(energy.data[,3],12, col = "orangered1",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()