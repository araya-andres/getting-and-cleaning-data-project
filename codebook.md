CodeBook
========

Data Source
-----------

This dataset is derived from the "Human Activity Recognition Using
Smartphones Data Set" which is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information
--------------------

For this project, we are interested on the following files:

* 'features_info.txt': Shows information about the variables used on the
feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': List of all activities. 

* 'train/X_train.txt': Training set.

* 'train/subject_train.txt': Each row identifies the subject who
performed the activity.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': Each row identifies the subject who
performed the activity.

From the original dataset, we only kept the mean and standard deviation for each variable (since the assigment explicitly states that).

Transformation detailes
-----------------------

The scripts follows roughly the steps of the project:

1. Merges the training and the test sets to create one data set. After this step, the variables already have a descriptive name.
2. Extracts the mean and standard deviation for each measurement.
3. Adds a description for the activities in the data set. 
4. Creates the new data set with the average of each variable for each activity and each subject.
