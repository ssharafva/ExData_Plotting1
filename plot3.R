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
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

## Create plot and send to the PNG device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, {
    plot(Time,Sub_metering_1, type="l", 
                xlab="", col="black",
                ylab="Energy sub metering")
    lines(Time,Sub_metering_2, col="red")
    lines(Time,Sub_metering_3, col="blue")
})
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()