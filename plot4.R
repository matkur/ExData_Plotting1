# change the Locale from my native locale to get the abbreviations 'Thu' ,'Fri', and 'Sat' on the graph
Sys.setlocale("LC_TIME", "English")

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
    "plot4.png",
    width = 480,
    height = 480,
    units = "px",
)

par(mfrow=c(2,2))

#Upper left
plot(data2$DateTime,data2$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')

#upper right
plot(data2$DateTime,data2$Voltage,xlab='datetime',ylab='Voltage',type='l')

#bottom left
plot(data2$DateTime,data2$Sub_metering_1,ylab='Energy sub metering', xlab='', type='l',col='black', lty="solid")
lines(data2$DateTime,data2$Sub_metering_2,col='red', lty="solid")
lines(data2$DateTime,data2$Sub_metering_3,col='blue', lty="solid")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c('solid','solid','solid'))

#bottom right
plot(data2$DateTime,data2$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')



dev.off()