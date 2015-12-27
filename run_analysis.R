# Getting and Cleaning Data Course Project

# Assumptions:
# 1) Assumes "UCI HAR Dataset" is already downloaded. Othrwise, we can use
#    download.file package the download the zip file.
# 2) Assumes "UCI HAR Dataset" directory is in the current working directory.

# Load libraries required for this project
library(data.table)
library(dplyr)

# Read training and test datasets

## Load labels from "UCI HAR Dataset" directory
featureNames <- read.table("UCI HAR Dataset/features.txt", header=F)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)

## Load training dataset
train.X.features <- read.table("UCI HAR Dataset/train/X_train.txt", header=F)
train.y.activity <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F)

## Load test dataset
test.X.features <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)
test.y.activity <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)

# STEP 1: Merges the training and the test sets to create one data set.

## Row bind training and test datasets
features <- rbind(train.X.features, test.X.features)
activity <- rbind(train.y.activity, test.y.activity)
subject <- rbind(train.subject, test.subject)

## name the columns
colnames(features) <- featureNames$V2
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

## merge the data
merged.data <- cbind(features,activity,subject)

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

## Find columns wit Mean, Std, Activity and Subject
colsMeanStd <- grep(".*mean.*|.*std.*", names(merged.data), ignore.case=T)
colsActSub <- grep("Activity|Subject", names(merged.data), ignore.case=T)
requiredColumns <- c(colsMeanStd, colsActSub)

## extract the data fo the abive required columns
extractedData <- merged.data[,requiredColumns]

# STEP 3: Uses descriptive activity names to name the activities in the data set

## Convert "Activity" column from number to character
extractedData$Activity <- as.character(extractedData$Activity)

## Replace the activity number with activity name
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,]$V2)
}

## Factor the activity & subject columns
extractedData$Activity <- as.factor(extractedData$Activity)
extractedData$Subject <- as.factor(extractedData$Subject)

# STEP 4: Appropriately labels the data set with descriptive variable names. 
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

# STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
extractedData <- data.table(extractedData)

## Create a tidy data set with average for each activity and subject.
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)

## Order the tidy dataset
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

## Write tidy data to a file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
