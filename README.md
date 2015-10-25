## Course Project for Getting and Cleaning Data

This code is part of the course project for Cousera course [Getting and Cleaning Data](https://class.coursera.org/getdata-033/).

## How to use the code

Make sure you have all the dependant libraries installed before you run this code.

Library dependencies (required):

1. dplyr

This code use the data from [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). You need to download this data and unzip it into your workspace. By default, the code will read the data from **UCI HAR Dataset** folder in your workspace. If your data is not in the default folder, you can pass in the folder path as the first argument in command line like this:
```
Rscript run_analysis.R your_data_path
```

The code will then output a **summary.txt** to your workspace.

## How the code works

The code generate the analysis in the following steps:

1. Load in the feature data from **features.txt**, and extracts only the features on the mean and standard deviation. The feature data is stored in variable **featureDf**
2. Activity data is loaded into variable **activityDf** in order to label the activity name later
3. A function **buildDataset** is defined for cleaning and merging feature, activity, and observation data. The function take in partiton (**train** or **test**) as the first argument along with **featureDf** and **activityDf**, and process that partition
4. **buildDataset** function is called seperately for **test** and **train** data, and the results are merged back to **finalDf**
5. Finally, we use dplyr to group the data by subjectId and activity, and produce the average of each variable
6. Write the result to **summary.txt** in your workspace

The output looks like this:

```
   subjectID         activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tBodyAcc-std()-X
       (int)           (fctr)             (dbl)             (dbl)             (dbl)            (dbl)
1          1          WALKING         0.2656969       -0.01829817        -0.1078457       -0.5457953
2          2          WALKING         0.2731131       -0.01913232        -0.1156500       -0.6055865
3          3          WALKING         0.2734287       -0.01785607        -0.1064926       -0.6234136
4          4          WALKING         0.2770345       -0.01334968        -0.1059161       -0.6838645
5          4 WALKING_UPSTAIRS         0.2696859       -0.01710851        -0.1100534       -0.4811578
6          5          WALKING         0.2791780       -0.01548335        -0.1056617       -0.5076910
7          6          WALKING         0.2694342       -0.01639111        -0.1179007       -0.6476692
8          6 WALKING_UPSTAIRS         0.2801791       -0.02069496        -0.1109400       -0.1270006
9          7 WALKING_UPSTAIRS         0.2702117       -0.01879049        -0.1124924       -0.5775183
10         8 WALKING_UPSTAIRS         0.2707591       -0.01818950        -0.1068096       -0.5829589
..       ...              ...               ...               ...               ...              ...
```
