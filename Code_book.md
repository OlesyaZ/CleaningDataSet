Code Book
================================================================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

-'README.txt'

-'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

-'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The R script **run_analysis.R** performs the following:

1. Merges the training and test sets to create one data set

  X_test.txt + X_train.txt  results in dataset Xdata (10299 x 561) 

  y_test.txt + y_train.txt  results in dataset Ydata (10299 x 1) with activity IDs.

  subject_test.txt  results in dataset Subject (10299 x 1) data frame with subject IDs,


2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

The result is Xdata(10299 x 66),  66 out of 561 attributes are measurements on the mean and standard deviation. 

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying

The scriptlabels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.

Subject,Ydata,Xdata are merged to dataset(10299x66)

The result is saved as clean_dataset.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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


5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.

The result is saved as dresult.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

   