# Getting and Cleaning Data Course Project

Merges the training and the test sets to create one data set.

## download zipped files, read data, and check dimension of datasets
install.packages('downloader')
library(downloader)

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, "./dataset.zip", mode="wb")
unzip("dataset.zip")
unlink(url)

# types of activity performed on train dataset: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt") # activity feature; dimension= [1, 561]

dimension_features <- dim(features)   # [1] 561   2 ; types of measurements
dimension_train_subject <- dim(train_subject)   # [1] 7352    1; subject id

dimension_train_x <- dim(train_x)   # [1] 7352  561
dimension_train_y <- dim(train_y)   # [1] 7352    1 # types of activity performed on train dataset: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
dimension_test_x <- dim(test_x)     # [1] 2947  561
dimension_test_y <- dim(test_y)     # [1] 2947    1

dimension_body_acc_x_train <- dim(body_acc_x_train)     # [1] 7352  128
dimension_gyro_acc_x_train <- dim(body_gyro_x_train)    # [1] 7352  128
dimension_total_acc_x_train <- dim(total_acc_x_train)   # [1] 7352  128

dimension_body_acc_y_train <- dim(body_acc_y_train)     # [1] 7352  128
dimension_gyro_acc_y_train <- dim(body_gyro_y_train)    # [1] 7352  128
dimension_total_acc_y_train <- dim(total_acc_y_train)   # [1] 7352  128

dimension_body_acc_z_train <- dim(body_acc_z_train)     # [1] 7352  128
dimension_gyro_acc_z_train <- dim(body_gyro_z_train)    # [1] 7352  128
dimension_total_acc_z_train <- dim(total_acc_z_train)   # [1] 7352  128

dimension_body_acc_x_test <- dim(body_acc_x_test)     # [1] 2947  128
dimension_gyro_acc_x_test <- dim(body_gyro_x_test)    # [1] 2947  128
dimension_total_acc_x_test <- dim(total_acc_x_test)   # [1] 2947  128

dimension_body_acc_y_test <- dim(body_acc_y_test)     # [1] 2947  128
dimension_gyro_acc_y_test <- dim(body_gyro_y_test)    # [1] 2947  128
dimension_total_acc_y_test <- dim(total_acc_y_test)   # [1] 2947  128

dimension_body_acc_z_test <- dim(body_acc_z_test)     # [1] 2947  128
dimension_gyro_acc_z_test <- dim(body_gyro_z_test)    # [1] 2947  128
dimension_total_acc_z_test <- dim(total_acc_z_test)   # [1] 2947  128

# Merge train and test datasets
train <- cbind.data.frame(train_subject, train_y, train_x, body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train , body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)
# > dim(train)
# [1] 7352 1715

test <- cbind.data.frame(test_subject, test_y, test_x, body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test , body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)
# > dim(test)
# [1] 2947 1715

totdata <- rbind.data.frame(train,test)
# > dim(totdata)
# [1] 10299  1715

features_names <- as.character(features[,2])

##################################################################################################
# Configure measurements

idbodyaccx <- c("body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_",
"body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_", "body_acc_x_", "body_acc_x_","body_acc_x_", "body_acc_x_")

idbodyaccy <- c("body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_",
             "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_", "body_acc_y_", "body_acc_y_","body_acc_y_", "body_acc_y_")

idbodyaccz <- c("body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_",
             "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_", "body_acc_z_", "body_acc_z_","body_acc_z_", "body_acc_z_")

idbodygyrox <- c("body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_",
              "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_", "body_gyro_x_", "body_gyro_x_","body_gyro_x_", "body_gyro_x_")

idbodygyroy <- c("body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_",
              "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_", "body_gyro_y_", "body_gyro_y_","body_gyro_y_", "body_gyro_y_")

idbodygyroz <- c("body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_",
              "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_", "body_gyro_z_", "body_gyro_z_","body_gyro_z_", "body_gyro_z_")

idtotalaccx <- c("total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_",
             "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_", "total_acc_x_", "total_acc_x_","total_acc_x_", "total_acc_x_")

idtotalaccy <- c("total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_",
             "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_", "total_acc_y_", "total_acc_y_","total_acc_y_", "total_acc_y_")

idtotalaccz <- c("total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_",
             "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_", "total_acc_z_", "total_acc_z_","total_acc_z_", "total_acc_z_")



num <- as.character(seq(1,128))

idbodyaccx_num <- paste(idbodyaccx, num, sep="")
idbodyaccy_num <- paste(idbodyaccy, num, sep="")
idbodyaccz_num <- paste(idbodyaccz, num, sep="")

idbodygyrox_num <- paste(idbodygyrox, num, sep="")
idbodygyroy_num <- paste(idbodygyroy, num, sep="")
idbodygyroz_num <- paste(idbodygyroz, num, sep="")

idtotalaccx_num <- paste(idtotalaccx, num, sep="")
idtotalaccy_num <- paste(idtotalaccy, num, sep="")
idtotalaccz_num <- paste(idtotalaccz, num, sep="")

measurement_id <- rbind(idbodyaccx_num, idbodyaccy_num, idbodyaccz_num, idbodygyrox_num, idbodygyroy_num, idbodygyroz_num, idtotalaccx_num, idtotalaccy_num, idtotalaccz_num)

names(totdata) <- c("subject_id", "activity_id", features_names, measurement_id )

##################################################################################################

# Extracts only the measurements on the mean and standard deviation for each measurement.

# extract the measurement names related to "mean"
mean_names <- features_names[grep("[mM][eE][aA][nN]", features_names)] # length=53

# extract the names of standard deviation
std_names <- features_names[grep("[sS][tT][dD]", features_names)] # length=33

Means <- totdata[ , mean_names] # dimension=[10299 53]
Stds <- totdata[ , std_names] # dimension=[10299 33]


# Combine data of measurements on the mean and standard deviation for each measurement.
Means_Stds <- cbind.data.frame(Means, Stds)

####################################################################################################

# Uses descriptive activity names to name the activities in the data set

# The types of activity performed on dataset are labeled numerically from 1 to 6, whcih are mapped to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
activity_names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
activity_idnames <- totdata$activity_id

# replace id number to activity names
activity_idnames <- gsub(1, "STANDING", activity_idnames)
activity_idnames <- gsub(2, "WALKING_UPSTAIRS", activity_idnames)
activity_idnames <- gsub(3, "WALKING_DOWNSTAIRS", activity_idnames)
activity_idnames <- gsub(4, "SITTING", activity_idnames)
activity_idnames <- gsub(5, "STANDING", activity_idnames)
activity_idnames <- gsub(6, "LAYING", activity_idnames)

# replace totdata$activity_id back to activity_idnames
totdata$activity_id <- activity_idnames

####################################################################################################

# Appropriately labels the data set with descriptive variable names.

# rename elements in features_names by following 3 steps:
# 1. replace "-" in features_names with "_"
# 2. eliminate "(" and ")" in features_names
# 3. replace "," in features_names with "_"

features_idnames <-features_names

features_idnames <- gsub("\\(|\\)", "", features_idnames)
features_idnames <- gsub("\\,", "_", features_idnames)
features_idnames <- gsub("\\-", "_", features_idnames)

# put renamed elements back in features_names
features_names <- features_idnames

# The descriptive names are created as follows.
names(totdata) <- c("subject_id", "activity_id", features_names, measurement_id )

####################################################################################################

# The following steps are meant to create descriptive variable names for Means_Stds tidy dataset

# rename elements in features_names by following 3 steps:
# 1. replace "-" in features_names with "_"
# 2. eliminate "(" and ")" in features_names
# 3. replace "," in features_names with "_"

mean_idnames <-mean_names
mean_idnames <- gsub("\\(|\\)", "", mean_idnames)
mean_idnames <- gsub("\\,", "_", mean_idnames)
mean_idnames <- gsub("\\-", "_", mean_idnames)

# put renamed elements back in features_names
mean_names <- mean_idnames


std_idnames <-std_names
std_idnames <- gsub("\\(|\\)", "", std_idnames)
std_idnames <- gsub("\\,", "_", std_idnames)
std_idnames <- gsub("\\-", "_", std_idnames)

# put renamed elements back in features_names
std_names <- std_idnames

# A tidy dataset for means and stds
Means_Stds_tidy <- cbind.data.frame(totdata$subject_id, totdata$activity_id, Means, Stds)

# The descriptive names are created as follows.
names(Means_Stds_tidy) <- c("subject_id", "activity_id", mean_names, std_names )


####################################################################################################
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

install.packages("plyr")
library(plyr)

tidydata <- Means_Stds_tidy[ , 1:2]

subject_activity_id <- paste(as.character(Means_Stds_tidy$subject_id), as.character(Means_Stds_tidy$activity_id), sep="_")
tidydata$subject_activity_id <- subject_activity_id

tidydata <- cbind.data.frame(tidydata, Means_Stds_tidy[ , 3:ncol(Means_Stds_tidy)])

# rename measurement names for 2nd tidy dataset
names(tidydata) <- c("subject_id", "activity_id", "subject_activity_id", mean_names, std_names)

install.packages("reshape2")
library(reshape2)

dataMelt <- melt(tidydata, id= c("subject_id", "activity_id", "subject_activity_id"), measure.vars=c(mean_names, std_names) )
tidydata <- dcast(dataMelt, subject_activity_id ~ variable, mean)

# write the tidy data set to a file
write.table(tidydata, "tidy_data.txt", row.names=FALSE)
