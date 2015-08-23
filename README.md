---
title: "README.md"
author: "Rigoberto Torres Mendoza"
date: "August 23, 2015"
output: html_document
---

This README.md file explain how the R script "run_analysis.R" works.  This R script has been submitted as a solution to the Course Project of Getting and Cleaning Data course (getdata-031).

##How to run the script?
You need to download the files of the original data provided to a directory in your machine.  The files are in this location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Extract the files.

Set the working directory where you have downloaded and extract the files

The working directory should have created the directory "UCI HAR Dataset" where the downloaded files are located. This is the default directory that is created when you extract the file.

### Load the packages (Note: you should have the packages installed previuosly)
```{r}
library(dplyr)
library(tidyr)
```

Now open and source the R script: `source("run_analysis.R")`


##How the script works?

This is the highlevel process description that the script follow to merge test and training files to create one data set:

  1. Load the test data and merge the 3 test files (X_test.txt, y_test.txt and subject_test.txt)
    + During the process of loading X_test.txt the col.names parameter is used to give name to variables from the features.txt file
  2. Remove columns unwanted in test data 
  3. Load the training data and merge the 3 training files (X_train.txt, y_train.txt and subject_train.txt)
    + During the process of loading X_test.txt the col.names parameter is used to give name to variables from the features.txt file
  4. Remove columns unwanted in training data
  5. Merge the test and training data in 1 single data set
  6. Create a separate tidy data set with the average of each variable for each subject and activity
  
### Naming the variables
The features file was uploaded to name the variables on the X-test.txt and X-train.txt files.

The features file contains the 561 variable names.  I used the parameter col.names in the read.table call when loading the data for X-test.txt and X-train.txt files.


### Selecting only the variables estimated for mean() and std()
I select the variables that contains mean and std which is the variables estimated of mean and standard deviation from the signals by using the select (dplyr) with special function matches.

```{r}
xtestreduced <- select(xtest,matches("mean|std", ignore.case=TRUE))
```


### Binding multiple dataframes into a single dataframe
I used `bind_cols` and `bind_rows` to bind files by columns first and then by rows in order to get to a single data set. For instance:

```{r}
testdata<-bind_cols(subjecttest, ytest, xtestreduced)
```


### Providing descriptive names to activities
The activities originally came with numeric codes from 1 to 6.  I used mutate (dplyr) to rename the activities with descriptive names.  I used a combination or identation of ifelse to accomplish the replacememts.

```{r}
testdata<-mutate(testdata,labelcode=ifelse(labelcode==1,"WALKING",ifelse(labelcode==2,"WALKING_UPSTAIRS",ifelse(labelcode==3,"WALKING_DOWNSTAIRS",ifelse(labelcode==4,"SITTING",ifelse(labelcode==5,"STANDING","LAYING"))))))
```


### Calculating the average of each variable for each subject and activity
I used group_by (dplyr) and summarise_each to generate the second separated tidy data set.

```{r}
tydi_smartphonedata<-smartphonedata %>% group_by(subjectcode, activity) %>% summarise_each(funs(mean))
```

