

## Constructing Type l Graph  
## Read Table
Dataset <- read.table("/Users/chahanasigdel/data/household_power_consumption.txt", header=TRUE, sep=";")

## Change the date formart using as.Date Function
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")

## Now subset the dates to two days 
SubDate <- subset(Dataset, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

##Now subset the time to two days
Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")

Submetering1 <- as.numeric(as.character(SubDate$Sub_metering_1))
Submetering2<- as.numeric(as.character(SubDate$Sub_metering_2))
Submetering3<- as.numeric(as.character(SubDate$Sub_metering_3))


## Bring together the  desired date and time
 Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")
 
 ## Plot
 
 plot(Datatime,Submetering1,type="l",xlab= "", ylab="Energy sub metering")
 lines(Datatime, Submetering2, col="Red")
 lines(Datatime, Submetering3, col="Blue")
 dev.copy(png, file="plot3.png", width=480, height=480)
 dev.off ()
