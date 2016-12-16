## Load all necessary packages
library(dplyr)
library(data.table)
library(tidyr)
library(lubridate)
## Merge Training and Test Sets to create one data set.
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")
XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
X<-rbind(XTest, XTrain)
Y<-rbind(YTest, YTrain)
Subject<-rbind(SubjectTest, SubjectTrain)

## Extract only the measurements on the mean and standard deviation for each measurement.
index<-grep("mean\\(\\)|std\\(\\)", features[,2])
X<-X[,index]

##Uses descriptive activity names to name the activities in the data set.
Y[,1]<-activity[Y[,1],2]

##Appropriately labels the data set with descriptive variable names.
names<-features[index,2]
names(X)<-names
names(Subject)<-"SubjectID"
names(Y)<-"Activity"
CleanedData<-cbind(Subject, Y, X)

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
CleanedData<-data.table(CleanedData)
TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity']

##Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
