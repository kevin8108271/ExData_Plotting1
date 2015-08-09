data<-read.table("household_power_consumption.txt",sep=";",na.strings='?',header=TRUE,quote='')
data$date=as.Date(data$Date,"%d/%m/%Y")
data$DateTime=paste(data$Date,data$Time)
data$DateTime=strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
newdata<-subset(data,data$date=="2007-02-02" | data$date=="2007-02-01")
png(height=480,width=480,file="forth.png")
par(mfrow=c(2,2))
with(newdata,plot(x=DateTime,y=Global_active_power,type="n",ylab="Globlal Active Power(kilowatts)",xlab=""))
with(newdata,lines(x=DateTime,y=Global_active_power))

with(newdata,plot(x=DateTime,y=Voltage ,type="n",ylab="Voltage",xlab='datetime'))
with(newdata,lines(x=DateTime,y=Voltage))


with(newdata,plot(x=DateTime,y=Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(newdata,lines(x=DateTime,y=Sub_metering_1,ylab="Energy sub metering",xlab=""))
with(newdata,lines(x=DateTime,y=Sub_metering_2,col='red'))
with(newdata,lines(x=DateTime,y=Sub_metering_3,col='blue'))
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(newdata,plot(x=DateTime,y=Global_reactive_power ,type="n",xlab='datetime'))
with(newdata,lines(x=DateTime,y=Global_reactive_power))
dev.off()