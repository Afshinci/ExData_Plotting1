#Loading 'Data.txt' which contains data of the days '2007-02-01' and '2007-02-02'
myData<-read.table("Data.txt",header = TRUE,sep=";",na.strings = "?")
myData$Date<-as.Date(as.character(myData$Date),format = "%d/%m/%Y")
#Creating variable 'DateTime'by concatenating variables 'Date' and 'Time'
myData$DateTime<-strptime(paste(as.character(myData$Date),as.character(myData$Time)),
                          format = "%Y-%m-%d %H:%M:%S")
#Creating file 'plot4.png'
png(file="plot2.png")
#Plotting Global Active power using function plot()
with(myData,plot(DateTime,Global_active_power,type = "l",xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
dev.off()
