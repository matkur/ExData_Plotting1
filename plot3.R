library(datasets)

#read the file
data1<-read.csv('household_power_consumption.txt',sep=';',na.strings = "?",strip.white=TRUE,
                stringsAsFactors=FALSE)

#select the data rows
data2 <- data1[as.Date(data1$Date,format='%d/%m/%Y') >='2007-02-01' 
               & as.Date(data1$Date,format='%d/%m/%Y') <='2007-02-02'  ,]
# Create a new column 'DateTime', POSIXct format from combining and character columns 'Date' and 'Time' 
data2["DateTime"]<-paste(data2$Date,data2$Time,sep=" ")

data2["DateTime"]<- as.POSIXct(data2$DateTime, format='%d/%m/%Y %H:%M')
data1<-NULL

#put the plot in a file
png(
    "plot3.png",
    width = 480,
    height = 480,
    units = "px",
)

plot(data2$DateTime,data2$Sub_metering_1,ylab='Energy sub metering', xlab='', type='l',col='black', lty="solid")
lines(data2$DateTime,data2$Sub_metering_2,col='red', lty="solid")
lines(data2$DateTime,data2$Sub_metering_3,col='blue', lty="solid")

legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c('solid','solid','solid'))
 
dev.off()