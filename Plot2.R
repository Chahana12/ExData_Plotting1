

## Constructing Plot2 Graph  
## Read Table by creating a variable called "Dataset
Dataset <- read.table("/Users/chahanasigdel/data/household_power_consumption.txt", header=TRUE, sep=";")

## Change the date format using as.Date Function
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")

##Change the time format using strptime
Dataset$Time<- strptime(Dataset$Time, format="%H:%M:%S")

## Now subset the dates to two days 
SubDate <- subset(Dataset, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))

##Now subset the time to two days and join
Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")

## Subset the three "Energy Sub Metering" to the desired dates 
Submetering1 <- as.numeric(as.character(SubDate$Submetering1))

## Plot

Datatime <- strptime(paste(SubDate$Date, SubDate$Time), "%Y-%m-%d %H:%M:%S")
plot(Datatime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
