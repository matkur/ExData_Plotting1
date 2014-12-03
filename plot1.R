
library(datasets)
data1<-read.csv('household_power_consumption.txt',sep=';',na.strings = "?",strip.white=TRUE,
                stringsAsFactors=FALSE)

data2 <- data1[as.Date(data1$Date,format='%d/%m/%Y') >='2007-02-01' 
               & as.Date(data1$Date,format='%d/%m/%Y') <='2007-02-02'  ,]

data1<-NULL


png(
    "plot1.png",
    width = 480,
    height = 480,
    units = "px",
)

hist(data2$Global_active_power,main="Global Activce Power", xlab="Global Activce Power (kilowatts)", col="red") 
dev.off()