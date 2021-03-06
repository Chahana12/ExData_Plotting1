

## Constructing Type l Graph  
## Read Table
Dataset <- read.table("/Users/chahanasigdel/data/household_power_consumption.txt", header=TRUE, sep=";")

## Change the date formart using as.Date Function
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")

##Change the time format using strptime
Dataset$Time<- strptime(Dataset$Time, format="%H:%M:%S")

## Now subset the dates to two days 
SubDate <- subset(Dataset, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

##Now subset the time to two days
Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")

## Convert Global Active Power 
Global_active_power <- as.numeric(as.character(SubDate$Global_active_power))

## Convert the submetering columns 
Submetering1 <- as.numeric(as.character(SubDate$Sub_metering_1))
Submetering2<- as.numeric(as.character(SubDate$Sub_metering_2))
Submetering3<- as.numeric(as.character(SubDate$Sub_metering_3))

##Convert the voltage column

Voltage <- as.numeric((as.character(SubDate$Voltage)))

## Convert Global Reactive Power 
GlobalReactivePower <- as.numeric(As.character(SubDate$Global_reactive_power))


## Bring together the  desired date and time
Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")

## Now create subsequent plots

par(mfrow=c(2,2))

png (file="plot4.png", width=480, height=480)
plot(Datatime,Global_active_power, type="l", xlab="", ylab = "Global Active Power")


plot(Datatime,Voltage, type= "l", xlab= "Voltage", ylab="datetime")



plot(Datatime,Submetering1,type="l",xlab= "", ylab="Energy sub metering")
lines(Datatime, Submetering2, col="Red")
lines(Datatime, Submetering3, col="Blue")


GlobalReactivePower<- plot(Datatime,GlobalReactivePower,type="l", xlab = "dateime", ylab="Global_reactive_power")
dev.off()

