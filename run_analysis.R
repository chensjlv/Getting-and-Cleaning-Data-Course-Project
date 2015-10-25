library(dplyr)

## load in the feature data, and extracts only the measurements on the mean and standard deviation
featureDf <- read.csv(file.path('UCI HAR Dataset', 'features.txt'), sep = '', header = FALSE, col.names = c('index', 'feature'))
featureLogical <- grepl('mean\\(\\)|std\\(\\)', featureDf$feature)
featureDf <- featureDf[featureLogical,]

## load in activity data to get the activity name
activityDf <- read.csv(file.path('UCI HAR Dataset', 'activity_labels.txt'), sep = '', header = FALSE, col.names = c('index', 'activity'))

## Attach subject ID; filter out irrelevant varibles from the data set for this analysis
## Uses descriptive activity names from the activity data to name the activities in the data set
## Labels the varibles in data set with feature names
buildDataset <- function(partition, featureDf, featureLogical, activityDf) {
  folder <- file.path("UCI HAR Dataset", partition)
  subject <- read.csv(file.path(folder, sprintf('subject_%s.txt', partition)), sep = '', header = FALSE, col.names = c('index'))
  observation <- read.csv(file.path(folder, sprintf('X_%s.txt', partition)), sep = '', header = FALSE, colClasses = sapply(featureLogical, function(x) if (x) 'numeric' else 'NULL'))
  activity <- read.csv(file.path(folder, sprintf('y_%s.txt', partition)), sep = '', header = FALSE, col.names = c('index'))
  activity <- merge(activity, activityDf)
  colnames(observation) <- featureDf$feature
  observation$activity <- activity$activity
  observation$subjectID <- subject$index
  observation
}

## merge train and test set
partitions <- c('train', 'test')
finalDf <- lapply(partitions, buildDataset, featureDf, featureLogical, activityDf)
finalDf <- do.call(rbind, finalDf)
## calculate the average of each variable for each activity and each subject
summaryDf <- finalDf %>% group_by(subjectID, activity) %>% summarise_each(funs(mean))
## write output to a file
write.table(summaryDf, file = "summary.txt", row.name=FALSE)
