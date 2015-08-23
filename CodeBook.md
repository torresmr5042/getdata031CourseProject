---
title: "CodeBook.md"
author: "Rigoberto Torres Mendoza"
date: "August 23, 2015"
output: html_document
---

This is an R Markdown document to describe the variables, the data and the transformations performed to clean up and tidy the data set for Course Project of Getting and Cleaning Data course. 


##Variables
These are the variables included in the data set ` tidy_smartphonedata ` which are the average of the provided variables in the test and training data sets.

The original variables in the test and training data sets were estimated from the 3-axial signals coming from the accelerometer and gyroscope of the smartphone Galaxy S II during the experiment perfomed.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING).

The variables that were taken from the original data sets are only the estimated for:

- mean(): Mean value
- std(): Standard deviation

Out of 561 variables the ones resulted from the estimation of mean() and std() are 86 variables.

In addition to the 86 variables there are 2 more variables to describe the subject who perform the activity and the activity description.


**tidy_smartphonedata:**

* subjectcode                 *-person id codification who perfomed the test*
* activity                *-activity: WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING*
* tBodyAcc-mean()-X       *"t" is for time and "acc" is for accelerometer for all variables containing these strings*
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X    *"Gyro" is for Gyroscope for all variables containing this string*
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()    *"Mag" is for magnitude for all variables containing this string*
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X     *"f" is for frequency for all variables containing this string*
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)


## Data

The data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation


## Transformations

Highlevel process to merge test and training files to create one data set:
  1. Load the test data and merge the 3 test files
  2. Remove columns unwanted in test data 
  3. Load the training data and merge the 3 training files
  4. Remove columns unwanted in training data
  5. Merge the test and training data in 1 single data set
  6. Create a separate tydi data set with the average of each variable for each subject and activity
  
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

