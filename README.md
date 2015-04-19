#GETTING AND CLEANING DATA - Course Project
###Introduction

This github respository contains information on the Coursera Getting and Cleaning Data Course Project.  The purpose of this project is to demonstrate how to collect, work with and clean a data set to be used for a later analysis.

The deliverables for this project are:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Description of Files
This respository includes the following files:

- CodeBook.md - descriptions of the variables, the data and transformations

- run_analysis.R - Rscript for analysis

- tidy.txt - final tab-delimited text file

###Data Execution
The data set "Human Activity Recognition Using Smartphones" has been taken from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The run_analysis.R is the script that has been used to process and transform the raw data into it's final output, found in the tidy.txt file.  This script can be run in R/RStudio.