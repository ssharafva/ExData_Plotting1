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

data$Time<-as.POSIXct(strptime(paste(data$Date,data1$Time), 
                                   format="%d/%m/%Y %H:%M:%S"))
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)

## Create plot and send to the PNG device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(data, plot(Time,Global_active_power, type="l", 
         xlab="", col="black",
         ylab="Global Active Power"))
dev.off()