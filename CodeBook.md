## Code Book
This code book is for the Getting and Cleaning Data Course Project.  
It describes variables that are produced by the run_analysis.R program.

Datasource:  The <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set</a>

Output Variables:
<ul>
  <li>sample: 
    <ul>
      <li>Data type: Integer of 1 or 2</li>
      <li>Description: sample ID; 1 is train sample, 2 is test sample.</li>
    </ul>
  </li>
  <li>subject: 
    <ul>
      <li>Data type: Integer from 1-30</li>
      <li>Description: subject ID.  There are 30 participants in the study.</li>
    </ul>
  </li>
  <li>activity: 
    <ul>
      <li>Data type: Characters of one the values [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING]</li>
      <li>Description: name of the activity performed.</li>
    </ul>
  The following is a list of 66 variables that are the average of the mean and std dev calculations for feature measurements by each activity and each subject.  They are all of the numeric data type.
  <ul>
    <li>tBodyAcc-mean()-X_avg</li>
    <li>tBodyAcc-mean()-Y_avg</li>
    <li>tBodyAcc-mean()-Z_avg</li>
    <li>tGravityAcc-mean()-X_avg</li>
    <li>tGravityAcc-mean()-Y_avg</li>
    <li>tGravityAcc-mean()-Z_avg</li>
    <li>tBodyAccJerk-mean()-X_avg</li>
    <li>tBodyAccJerk-mean()-Y_avg</li>
    <li>tBodyAccJerk-mean()-Z_avg</li>
    <li>tBodyGyro-mean()-X_avg</li>
    <li>tBodyGyro-mean()-Y_avg</li>
    <li>tBodyGyro-mean()-Z_avg</li>
    <li>tBodyGyroJerk-mean()-X_avg</li>
    <li>tBodyGyroJerk-mean()-Y_avg</li>
    <li>tBodyGyroJerk-mean()-Z_avg</li>
    <li>tBodyAccMag-mean()_avg</li>
    <li>tGravityAccMag-mean()_avg</li>
    <li>tBodyAccJerkMag-mean()_avg</li>
    <li>tBodyGyroMag-mean()_avg</li>
    <li>tBodyGyroJerkMag-mean()_avg</li>
    <li>fBodyAcc-mean()-X_avg</li>
    <li>fBodyAcc-mean()-Y_avg</li>
    <li>fBodyAcc-mean()-Z_avg</li>
    <li>fBodyAccJerk-mean()-X_avg</li>
    <li>fBodyAccJerk-mean()-Y_avg</li>
    <li>fBodyAccJerk-mean()-Z_avg</li>
    <li>fBodyGyro-mean()-X_avg</li>
    <li>fBodyGyro-mean()-Y_avg</li>
    <li>fBodyGyro-mean()-Z_avg</li>
    <li>fBodyAccMag-mean()_avg</li>
    <li>fBodyBodyAccJerkMag-mean()_avg</li>
    <li>fBodyBodyGyroMag-mean()_avg</li>
    <li>fBodyBodyGyroJerkMag-mean()_avg</li>
    <li>tBodyAcc-std()-X_avg</li>
    <li>tBodyAcc-std()-Y_avg</li>
    <li>tBodyAcc-std()-Z_avg</li>
    <li>tGravityAcc-std()-X_avg</li>
    <li>tGravityAcc-std()-Y_avg</li>
    <li>tGravityAcc-std()-Z_avg</li>
    <li>tBodyAccJerk-std()-X_avg</li>
    <li>tBodyAccJerk-std()-Y_avg</li>
    <li>tBodyAccJerk-std()-Z_avg</li>
    <li>tBodyGyro-std()-X_avg</li>
    <li>tBodyGyro-std()-Y_avg</li>
    <li>tBodyGyro-std()-Z_avg</li>
    <li>tBodyGyroJerk-std()-X_avg</li>
    <li>tBodyGyroJerk-std()-Y_avg</li>
    <li>tBodyGyroJerk-std()-Z_avg</li>
    <li>tBodyAccMag-std()_avg</li>
    <li>tGravityAccMag-std()_avg</li>
    <li>tBodyAccJerkMag-std()_avg</li>
    <li>tBodyGyroMag-std()_avg</li>
    <li>tBodyGyroJerkMag-std()_avg</li>
    <li>fBodyAcc-std()-X_avg</li>
    <li>fBodyAcc-std()-Y_avg</li>
    <li>fBodyAcc-std()-Z_avg</li>
    <li>fBodyAccJerk-std()-X_avg</li>
    <li>fBodyAccJerk-std()-Y_avg</li>
    <li>fBodyAccJerk-std()-Z_avg</li>
    <li>fBodyGyro-std()-X_avg</li>
    <li>fBodyGyro-std()-Y_avg</li>
    <li>fBodyGyro-std()-Z_avg</li>
    <li>fBodyAccMag-std()_avg</li>
    <li>fBodyBodyAccJerkMag-std()_avg</li>
    <li>fBodyBodyGyroMag-std()_avg</li>
    <li>fBodyBodyGyroJerkMag-std()_avg</li>
  </ul>


