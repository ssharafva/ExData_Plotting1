## Creat a sub-directory for the work (if necessary) and switch WD
mainDir <- "C:/Users/ssharaf/Documents/RWD"
setwd(mainDir)
subDir <- "Course4"
if (file.exists(subDir)){
    setwd(file.path(mainDir, subDir))
} else {
    dir.create(file.path(mainDir, subDir))
    setwd(file.path(mainDir, subDir))
}
subDir <- "Proj1"
if (file.exists(subDir)){
    setwd(file.path(getwd(), subDir))
} else {
    dir.create(file.path(getwd(), subDir))
    setwd(file.path(getwd(), subDir))
}

## Download zip file
zip.file <- "household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, zip.file)

## Open and read zip file
filename <- "household_power_consumption.txt"
data <- read.table(unz(zip.file, filename), header=TRUE, sep=';',as.is = TRUE)
data <- subset.data.frame (data, Date %in% c("1/2/2007","2/2/2007"))

## Convert data as necessary
data$Global_active_power<-as.numeric(data$Global_active_power)

## Create plot and send to the PNG device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data1$Global_active_power, main="Global Active Power", col="red",
         xlab="Global Active Power (kilowatts)", xlim=c(0,6))
dev.off()