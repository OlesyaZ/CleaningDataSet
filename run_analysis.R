setwd("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet")
## 1. Merges the training and the test sets to create one data set.
X_test <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/test/X_test.txt", 
                     header=F, stringsAsFactors=FALSE,quote="\"")

X_train <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/train/X_train.txt", 
                      header=F, stringsAsFactors=FALSE,quote="\"")

Xdata<-rbind(X_test,X_train)


y_test <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/train/y_train.txt", quote="\"")
  
Ydata<-rbind(y_test,y_train)

subject_test <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/train/subject_train.txt", quote="\"")

Subject <- rbind(subject_test,subject_train)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/features.txt", 
                       header=FALSE, stringsAsFactors=FALSE,quote="\"")
good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
Xdata <- Xdata[, good_features]

## 3.Uses descriptive activity names to name the activities in the data set
names(Xdata) <- features[good_features, 2]
names(Xdata) <- gsub("\\(|\\)", "", names(Xdata))
names(Xdata) <- tolower(names(Xdata)) 

## 4.Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/UCI HAR Dataset/activity_labels.txt", quote="\"")
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
Ydata[,1] = activity_labels[Ydata[,1], 2]
names(Ydata) <- "activity"
names(Subject) <- "subject"

## 5. tidy data set 

dataset<-data.frame(Subject,Ydata,Xdata)
write.table(dataset, "~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/clean_dataset.txt")

## 6.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


result <- aggregate(.~subject+activity,data=dataset,mean)
write.table(result, "~/Documents/Olesya/Getting and Cleaning Data/CleaningDataSet/result.txt")



