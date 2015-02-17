# Getting and Cleaning Data Course Project
## Project Assignment Description 
From https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Procedure for Project
1.  Download source data zip file for the project from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it.
2.  Perform "Merges the training and the test sets to create one data set" by:

    a. For the test sample data, read the subject data, X data, and Y data into data frames, merge them and label them appropriately in a test dataframe.

    b. For the train sample data, read the subject data, X data, and Y data into data frames, merge them and label them appropriately in a train dataframe.
    
    c. Merge the test dataframe and train dataframe into a single dataframe, called _theDataSet_.
    
3.  Perform "Extracts only the measurements on the mean and standard deviation for each measurement" by:

    a. Determine the rows of the feature dataframes that contain the text "mean()" and "std()".
    
    b. Extract all columns from _theDataSet_ that maps to all of the rows from step above and save it in the _meanStdDF_ dataframe.

4.  Perform "Uses descriptive activity names to name the activities in the data set" by:

    a. Read the activity_labels.txt into a dataframe.  (The activity names are in the activity_labels.txt)
    
    b. Join it with the _meanStdDF_ dataframe, save the result in _meanStdActivityDF_. 
5. Perform "Appropriately labels the data set with descriptive variable names" by:

    a. Find the corresponding labels for the measurements in the _meanStdActivityDF_.  The labels are found in the featuresData.
    
    b. Replace the measurement colunm names with the labels.

6. Perform "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject" by:

