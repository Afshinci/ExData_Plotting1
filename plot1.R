#Loading 'Data.txt' which contains data of the days '2007-02-01' and '2007-02-02'
myData<-read.table("Data.txt",header = TRUE,sep=";",na.strings = "?")
#Creating variable 'DateTime'by concatenating variables 'Date' and 'Time'
myData$DateTime<-strptime(paste(as.character(myData$Date),as.character(myData$Time))
                          ,format = "%Y-%m-%d %H:%M:%S")
#Creating file 'plot4.png'
png(file="plot1.png")
#Plotting the histogram of Global Active Power variable and specifying the color as red
with(myData,hist(Global_active_power,col="red",xlab = "Global Active Power(Kilowatts)",
                 main = "Global Active Power"))
dev.off()