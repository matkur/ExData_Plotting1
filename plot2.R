Sys.setlocale("LC_TIME", "English")
library(datasets)
data1<-read.csv('household_power_consumption.txt',sep=';',na.strings = "?",strip.white=TRUE,
                stringsAsFactors=FALSE)

data2 <- data1[as.Date(data1$Date,format='%d/%m/%Y') >='2007-02-01' 
               & as.Date(data1$Date,format='%d/%m/%Y') <='2007-02-02'  ,]

data2["DateTime"]<-paste(data2$Date,data2$Time,sep=" ")

data2["DateTime"]<- as.POSIXct(data2$DateTime, format='%d/%m/%Y %H:%M')
data1<-NULL

png(
    "plot2.png",
    width = 480,
    height = 480,
    units = "px",
)
plot(data2$DateTime,data2$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
 
dev.off()