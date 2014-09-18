### load train and test dataset
dtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
dtest <- read.table("./UCI HAR Dataset/test/X_test.txt")

### join the two sets
data <- rbind(dtrain, dtest)

### part 1 of the Assignment completed
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = c("numeric", "character"))
colnames(data) <- features[,2]

### now any column has a name
### part 4 of the Assignment completed

### select the measurements on the mean and standard deviation for each measurement
data <- data[, grepl("mean\\(\\)" ,features[,2]) | grepl("std\\(\\)", features[,2])]

### part 2 of the Assignment completed


### load y labels for train and test data sets
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

### join the two label
ydata <- rbind(ytrain, ytest)

### load activity code table (1 Walking.. etc)
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses=c("numeric", "character"))
ydata <- factor(ydata[,1])
levels(ydata) <- activity[,2]

data$Activity <- ydata

### Now the activities are easier to understand
### part 3 of the Assignment completed

strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
sdata <- rbind(strain, stest)

data$Subject <- sdata[,1]

library(reshape2)
varnames <- colnames(data)

tidydata <- melt(data, id=c("Activity", "Subject"), measure.vars = head(varnames, n=length(varnames)-2))
tidydata <- dcast(tidydata, Activity+Subject~variable, mean)