

## Constructing Plot1, Histogram  
## Read Table by creating a variable called "Dataset"
Dataset <- read.table("/Users/chahanasigdel/data/household_power_consumption.txt", header=TRUE, sep=";")

## Change the date format using as.Date Function
Dataset$Date <- as.Date(Dataset$Date,format="%d/%m/%Y")

## Subset the dates to two days (Feb1 and Feb 2)  
SubDate <- subset(Dataset, subset=(Date >="2007-02-01" & Date <= "2007-02-02"))
## Now pass the Global Active Power as a numeric (Notice we use data from "SubDate" variable)
Global_active_power <- as.numeric(as.character(SubDate$Global_active_power))
##Plot histogram
hist(Global_active_power, main="Global Active Power", 
     xlab="GAP (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
