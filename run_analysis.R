library(data.table)
library(plyr)
library(dplyr)

################################################################################
#
# This is the R code for the Getting and Cleaning Data course project.
#
################################################################################

#
# Step 1. Merges the training and the test sets to create one data set.
# The result data set is called theDataSet.
#

# Data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and unzipped to the directory C:\workspace\courses\get-clean-data\data\UCI HAR Dataset.

dataDir <- "C:\\workspace\\courses\\get-clean-data\\data\\UCI HAR Dataset"

# CombineData functions takes in the data directory name and sample name (train or test) as input.
# It reads the subject data, X data, and Y data into data frames, merge them and label them appropriately, and
# returns the merged and labelled dataframe.
combineSampleData <- function(directory, sampleName) {

	# Read and process subject data
	subjectFileName <- paste(directory, "\\", sampleName, "\\subject_" , sampleName, ".txt", sep="")
	subjectData <- read.table(subjectFileName)
	colnames(subjectData) <- "subject"

	# Read and process X data
	xFileName <- paste(directory, "\\", sampleName, "\\X_" , sampleName, ".txt", sep="")
	xData <- read.table(xFileName)

	# Merge the subject and X data.  The number of rows in subject dataset is the same as that for X dataset.
	mergedXData <- cbind(subjectData, xData)

	# Add column to the merged X dataset to identify the sample set where the data come from (train or test)
	mergedXData <- cbind(sample=sampleName, mergedXData)

	# Read and process Y data
	yFileName <- paste(directory, "\\", sampleName, "\\y_" , sampleName, ".txt", sep="")
	yData <- read.table(yFileName)
	colnames(yData) <- "activity_id"

	# Combine the merged X data with the y data
	combinedDF <- cbind(mergedXData, yData)

	# Return the result
	combinedDF	
}

trainDataSet <- combineSampleData(dataDir, "train")
testDataSet <- combineSampleData(dataDir, "test")

# Merge train data with test data into single data set
columns <- intersect(names(trainDataSet), names(testDataSet))
theDataSet <- merge(trainDataSet, testDataSet, by=columns, all=TRUE)

#
# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#

# The feature.txt data specifies where the names of the all means and standard deviation measurements.
# The rows of the features data table map to the columns of the train and test data sets.  So to perform step 2,
# we need to:
#	a. Read the feature.txt file into a dataframe.
#	b. Determine the rows of the feature dataframes that contain the text "mean()" and "std()".
#	c. Extract all columns from theDataSet that maps to all of the rows from step b.

# a. Read the feature.txt file
featuresFileName = paste(dataDir, "\\features.txt", sep="")
featuresData = read.table(featuresFileName)
colnames(featuresData) <- c("feature_id", "feature")

# b. Determine the rows of the feature dataframes that contain the text "mean()" and "std()".
meanStdRows <- c(grep("mean()", featuresData$feature, fixed=TRUE),  grep("std()", featuresData$feature, fixed=TRUE))

# c. Extract all columns from theDataSet that maps to all of the rows from step b.
# Because the combined train/test dataset was created with two additional columns "sample" and "subject" as columns 
# 1 and 2, we need to add 2 to all measurement column IDs.
meanStdCols <- meanStdRows + c(2)

# features dataframe with only mean/std measurements
featuresMeanStd <- featuresData[meanStdRows,]

# train/test data with mean/std measurements
meanStdDF <- theDataSet[, c(1:2, meanStdCols, grep("activity_id", colnames(theDataSet)))]

#
# Step 3. Uses descriptive activity names to name the activities in the data set
#

# The activity names are in the activity_labels.txt.  So to perform step 3, we need to read the activity_labels.txt
# into a dataframe and then join it with the meanStdDF dataframe.

# Read the activity_labels.txt file into a dataframe
activitiesFileName = paste(dataDir, "\\activity_labels.txt", sep="")
activitiesData = read.table(activitiesFileName)
colnames(activitiesData ) <- c("activity_id", "activity")

# Join the meanStdDF with the activitiesData
meanStdDF <- data.table(join(meanStdDF, activitiesData))

# Rearrange the columns so that they are of order sample, subject, activity, activity_id, followed by all 
# measurement columns.  We drop the activity_id column because we already have the activity column.
meanStdActivityDF <- select(meanStdDF, sample, subject, activity, V1:V543)

#
# Step 4. Appropriately labels the data set with descriptive variable names.
#

# For this step, we need to label all measurements with their names, which are in the featuresMeanStd dataframe that we 
# created in Step 2.
featureNames <- featuresMeanStd$feature

# The columns for all feature measurements in the meanStdActivityDF dataframe start at column 4
featureCols <- colnames(meanStdActivityDF)[4:length(colnames(meanStdActivityDF))]

# The elements in featureNames and featureCols are in the same order.
meanStdActivityLabelData <- setnames(meanStdActivityDF, old=featureCols, new=as.character(featureNames))

#
# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
#

avgDataDF <- meanStdActivityLabelData %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Rename the measurement averages colunms by appending "_avg" to the column names to accurately depict the values
featureCols <- colnames(meanStdActivityLabelData)[4:length(colnames(meanStdActivityLabelData))]
newColNames <- paste(featureCols, "_avg", sep="")
avgDataDF <- setnames(avgDataDF, old=featureCols, new=newColNames)

# Save the tidy dataset to a file for upload
write.table(avgDataDF, file="avgDataTidy.txt", row.name=FALSE)
