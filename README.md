 Script works with data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Work phases:
1. Unzipping and loading data into memory
2. Merging training and testing sets. Constructing data frame from measurements, activity, subject data.
3. Grouping data by activity and subject. Calculating mean values for measurements.
4. Saving results

Code book:
activity - the name of activity. Possible values [ LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS]

subject_id - the ID of subject. Numeric. Range [1, 30]

Features that are measured in data sets experiments
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Fro every feature, this data set contains:
mean() - mean value. 
std() - standard deviation.

For detailed information about experiments go to https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.