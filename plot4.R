#Loading 'Data.txt' which contains data of the days '2007-02-01' and '2007-02-02'
myData<-read.table("Data.txt",header = TRUE,sep=";",na.strings = "?")
myData$Date<-as.Date(as.character(myData$Date),format = "%d/%m/%Y")
#Creating variable 'DateTime'by concatenating variables 'Date' and 'Time'
myData$DateTime<-strptime(paste(as.character(myData$Date),as.character(myData$Time))
                          ,format = "%Y-%m-%d %H:%M:%S")
#Creating file 'plot4.png'
png(file="plot4.png")
#Plotting last plot
par(mfrow=c(2,2),mar=c(4,4,2,2))
with(myData,plot(DateTime,Global_active_power,type = "l",xlab = "",
                 ylab = "Global Active Power"))
with(myData,plot(DateTime,Voltage,type = "l",xlab = "datetime",
                 ylab = "Voltage"))
with(myData,plot(DateTime,Sub_metering_1,type = "n",xlab = "",
                 ylab = "Energy sub metering"))
with(myData,points(DateTime,Sub_metering_1,type="l",col="black"))
with(myData,points(DateTime,Sub_metering_2,type="l",col="red"))
with(myData,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",pch=c(95,95,95),col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(myData,plot(DateTime,Global_reactive_power,type = "l",xlab = "datetime"))
dev.off()