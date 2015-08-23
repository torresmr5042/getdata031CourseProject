## Set the working directory where you need to download and extract the files
## The working directory should have created the directory "UCI HAR Dataset" where 
## the downloaded files are located. This is the default directory that is created when
## you extract the file:
##     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Set your own working directory like below:

##COMMENT NEXT 2 LINES AND SET YOUR OWN WORKING DIRECTORY
setwd("C:/Users/torresmr/Google Drive/Data Science/getdata-031")
getwd()
##[1] "C:/Users/torresmr/Google Drive/Data Science/getdata-031"


## Load the packages (Note: you should have the packages installed previuosly)
library(dplyr)
library(tidyr)

## 1. Highlevel process to merge test and training files:
##  a. Load the test data and merge the 3 test files
##        Remove columns unwanted in test data 
##  b. Load the training data and merge the 3 training files
##        Remove columns unwanted in training data
##  c. Merge the test and training data in 1 single data set

##  a. Load the test data and merge files subject_test.txt, X_test.txt and y.test.txt
####################################################################################################
##    Load subject_test.txt
testfile<-"./UCI HAR Dataset/test/subject_test.txt"
subjecttest<-read.table(testfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=c("subjectcode"))
#str(subjecttest)
#head(subjecttest)
#tail(subjecttest)

## Load features files so we can use the columns names coming from this file for X_test.txt
testfile<-"./UCI HAR Dataset/features.txt"
features<-read.table(testfile, header=FALSE,sep="",stringsAsFactors=FALSE,col.names=c("numcol","xcolumns"))
#str(features)
#head(features)
#tail(features)

##    Load X_test.txt
testfile<-"./UCI HAR Dataset/test/X_test.txt"
xtest<-read.table(testfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=features$xcolumns)
#str(xtest)
#head(xtest)
#tail(xtest)

##    Load y_test.txt
testfile<-"./UCI HAR Dataset/test/y_test.txt"
ytest<-read.table(testfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=c("activity"))
#str(ytest)
#head(ytest)
#tail(ytest)

##convert to tbl_df
features<-tbl_df(features)
subjecttest<-tbl_df(subjecttest)
xtest<-tbl_df(xtest)
ytest<-tbl_df(ytest)

## remove unwanted columns from xtest
## I select the variables that contains mean and std which is the variables estimated
## of mean and standard deviation from the signals 
xtestreduced <- select(xtest,matches("mean|std", ignore.case=TRUE))
xtestreduced<-tbl_df(xtestreduced)
#xtestreduced

## Bind multiple dataframes into a single dataframe with the test data
testdata<-bind_cols(subjecttest, ytest, xtestreduced)
testdata<-tbl_df(testdata)

##provide descriptive names to activities
testdata<-mutate(testdata,activity=ifelse(activity==1,"WALKING",ifelse(activity==2,"WALKING_UPSTAIRS",ifelse(activity==3,"WALKING_DOWNSTAIRS",ifelse(activity==4,"SITTING",ifelse(activity==5,"STANDING","LAYING"))))))


##  b. Load the training data and merge the 3 training files
###################################################################################
##    Load subject_train.txt
trainfile<-"./UCI HAR Dataset/train/subject_train.txt"
subjecttrain<-read.table(trainfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=c("subjectcode"))
#str(subjecttrain)
#head(subjecttrain)
#tail(subjecttrain)

## Load features files so we can use the columns names coming from this file for X_train.txt
trainfile<-"./UCI HAR Dataset/features.txt"
features<-read.table(trainfile, header=FALSE,sep="",stringsAsFactors=FALSE,col.names=c("numcol","xcolumns"))
#str(features)
#head(features)
#tail(features)

##    Load X_train.txt
trainfile<-"./UCI HAR Dataset/train/X_train.txt"
xtrain<-read.table(trainfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=features$xcolumns)
#str(xtrain)
#head(xtrain)
#tail(xtrain)

##    Load y_train.txt
trainfile<-"./UCI HAR Dataset/train/y_train.txt"
ytrain<-read.table(trainfile, header=FALSE,sep="",stringsAsFactors=TRUE,col.names=c("activity"))
#str(ytrain)
#head(ytrain)
#tail(ytrain)

##convert to tbl_df
features<-tbl_df(features)
subjecttrain<-tbl_df(subjecttrain)
xtrain<-tbl_df(xtrain)
ytrain<-tbl_df(ytrain)

## remove unwanted columns from xtrain
## I select the variables that contains mean and std which is the variables estimated
## of mean and standard deviation from the signals 
xtrainreduced <- select(xtrain,matches("mean|std", ignore.case=TRUE))
xtrainreduced<-tbl_df(xtrainreduced)
#xtrainreduced

## Bind multiple dataframes into a single dataframe with the train data
traindata<-bind_cols(subjecttrain, ytrain, xtrainreduced)
traindata<-tbl_df(traindata)

##provide descriptive names to activities
traindata<-mutate(traindata,activity=ifelse(activity==1,"WALKING",ifelse(activity==2,"WALKING_UPSTAIRS",ifelse(activity==3,"WALKING_DOWNSTAIRS",ifelse(activity==4,"SITTING",ifelse(activity==5,"STANDING","LAYING"))))))


##  c. Merge the test and training data in 1 single data set
########################################################################################################

##Merging (bind_rows) the test and training data set in a single data frame
smartphonedata<-bind_rows(testdata,traindata)
smartphonedata<-tbl_df(smartphonedata)



##  SECOND SEPARATE data set with the average of each variable for each subject and activity
########################################################################################################
tidy_smartphonedata<-smartphonedata %>% group_by(subjectcode, activity) %>% summarise_each(funs(mean))

##write.table(tidy_smartphonedata, file="tidy_smartphonedata.txt",row.name=FALSE)

print("run_analysis.R has finished processing...")


