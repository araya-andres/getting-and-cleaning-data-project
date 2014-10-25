Getting and Cleaning Data. Final Project
========================================

This is the final project for 'Getting Cleaning Data' class. It contains a single script (run_analysis.R), and assumes that the dataset was unzipped on the same directory. After 'sourcing' the file on R, you can run the function 'run.analysis' to get the new dataset.

The script follows roughly the same steps as the project description:

1. Merges the training and the test sets to create one data set. After this step, the variables already have a descriptive name.
2. Extracts the mean and standard deviation for each measurement. (grepl does the trick)
3. Adds a description for the activities in the data set. 
4. Creates the new data set with the average of each variable for each activity and each subject. (using functionality provided by the library 'reshape')
