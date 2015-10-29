---
title: "CodeBook.md"
author: "Yi Chen"
date: "October 25, 2015"
---

## Study Design

Information about the original experimental design and data gathering is in the README.md.

### Folder Structure

Data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Used the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Data Cleaning and Processing

The code generate the analysis in the following steps:

1. Load in the feature data from **features.txt**, and extracts only the features on the mean and standard deviation. The feature data is stored in variable **featureDf**
2. Activity data is read from **activity_labels.txt** and loaded into variable **activityDf** in order to label the activity name later
3. A function **buildDataset** is defined for cleaning and merging feature, activity, and observation data. The function take in partiton (**train** or **test**) as the first argument along with **featureDf** and **activityDf**, and return merged dataframe
4. **buildDataset** function is called seperately for **test** and **train** data, and the results are merged back to **finalDf**
5. Finally, we use dplyr to group the data by subjectId and activity, and produce the average of each variable
6. Write the result to **summary.txt** in your workspace

### Variable Names

Variable names are derived from the features.txt file. Only variables containing either "mean()" or "std()" are kept, corresponding to the mean and standard deviation of values computed from the 128-sample inertial signal windows. Thus the varible names in the final output is the same as the picked ones in the features.txt.

## Code Book

Variable Name                 | Description
------------------------------|------------
subjectID                     | Subject's ID 
activity                      | Activity tag
BodyAcc-mean()-X              | Varibles below are derived from the feature names in features.txt. mean() stands for Mean value, and std() stands for Standard deviation. Refer to features_info.txt for more details about what each variable represents.
tBodyAcc-mean()-Y             |
tBodyAcc-mean()-Z             |
tGravityAcc-mean()-X          |
tGravityAcc-mean()-Y          |
tGravityAcc-mean()-Z          |
tBodyAccJerk-mean()-X         |
tBodyAccJerk-mean()-Y         |
tBodyAccJerk-mean()-Z         |
tBodyGyro-mean()-X            |
tBodyGyro-mean()-Y            |
tBodyGyro-mean()-Z            |
tBodyGyroJerk-mean()-X        |
tBodyGyroJerk-mean()-Y        |
tBodyGyroJerk-mean()-Z        |
tBodyAccMag-mean()            |
tGravityAccMag-mean()         |
tBodyAccJerkMag-mean()        |
tBodyGyroMag-mean()           |
tBodyGyroJerkMag-mean()       |
fBodyAcc-mean()-X             |
fBodyAcc-mean()-Y             |
fBodyAcc-mean()-Z             |
fBodyAccJerk-mean()-X         |
fBodyAccJerk-mean()-Y         |
fBodyAccJerk-mean()-Z         |
fBodyGyro-mean()-X            |
fBodyGyro-mean()-Y            |
fBodyGyro-mean()-Z            |
fBodyAccMag-mean()            |
fBodyBodyAccJerkMag-mean()    |
fBodyBodyGyroMag-mean()       |
fBodyBodyGyroJerkMag-mean()   |
tBodyAcc-std()-X              |
tBodyAcc-std()-Y              |
tBodyAcc-std()-Z              |
tGravityAcc-std()-X           |
tGravityAcc-std()-Y           |
tGravityAcc-std()-Z           |
tBodyAccJerk-std()-X          |
tBodyAccJerk-std()-Y          |
tBodyAccJerk-std()-Z          |
tBodyGyro-std()-X             |
tBodyGyro-std()-Y             |
tBodyGyro-std()-Z             |
tBodyGyroJerk-std()-X         |
tBodyGyroJerk-std()-Y         |
tBodyGyroJerk-std()-Z         |
tBodyAccMag-std()             |
tGravityAccMag-std()          |
tBodyAccJerkMag-std()         |
tBodyGyroMag-std()            |
tBodyGyroJerkMag-std()        |
fBodyAcc-std()-X              |
fBodyAcc-std()-Y              |
fBodyAcc-std()-Z              |
fBodyAccJerk-std()-X          |
fBodyAccJerk-std()-Y          |
fBodyAccJerk-std()-Z          |
fBodyGyro-std()-X             |
fBodyGyro-std()-Y             |
fBodyGyro-std()-Z             |
fBodyAccMag-std()             |
fBodyBodyAccJerkMag-std()     |
fBodyBodyGyroMag-std()        |
fBodyBodyGyroJerkMag-std()    |