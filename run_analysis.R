##Getting & Cleaning Data - Course Project

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##############
#Download and unzip files
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","tidy.zip")
unzip("tidy.zip")

#Import activity label and features data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id","activity")

features <- read.table("./UCI HAR Dataset/features.txt")

#Import test label, subject and data files
#4. Appropriately labels the data set with descriptive variable names. 
test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
colnames(test)<-features$V2

test_lab <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
colnames(test_lab) <- c("activity_id")

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
colnames(test_subject) <- c("subject_id")

#Append subject and activity columns to test dataset
test_full <- cbind(test_subject, test_lab, test)

####################################################
#Import train label, subject and data files
#4. Appropriately labels the data set with descriptive variable names.
train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
colnames(train)<-features$V2

train_lab <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
colnames(train_lab) <- c("activity_id")

train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
colnames(train_subject) <- c("subject_id")

#Append subject and activity columns to train dataset
train_full <- cbind(train_subject, train_lab, train )

####################################################
##1. Merges the training and the test sets to create one data set.
combine <- rbind(test_full, train_full)

##3. Uses descriptive activity names to name the activities in the data set
combine2 <- merge(combine, activity_labels, by="activity_id")

###################################################
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
combine_subset <- cbind(combine2[,c(1,564,2)],
                        combine2[,grepl("mean", colnames(combine2))],
                        combine2[,grepl("std", colnames(combine2))])

###################################################
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- aggregate(.~ activity_id + activity + subject_id, data=combine_subset, mean)       

write.table(tidy, file="tidy.txt", sep="\t", row.name=FALSE, quote=FALSE)
