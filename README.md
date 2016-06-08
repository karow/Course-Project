# Course-Project

## Course Project for "Getting and Cleaning Data" on Coursera

I created a script called "run_analysis.R" to analyse the dataset "Human Activity Recognition Using Smartphones"
The script includes comments that explain the lines of code.

In a nutshell:

1.
The "Test Data" is being read into R Studio and assigned to a variable. 
test_volunteer are the different people that participated in the study represented as numbers.
test_X are the different activities that the volunteers performed, represented as numbers.
test_Y are the different measurements/obersvations for each volunteer (test_volunteer) and activity (test_X).

2.
test_X (the activities) is being renamed. The number that represents the activities are renamed to descriptive values.
1 <- "walking"
2 <- "walking_upstairs"
3 <- "walking_downstairs"
4 <- "sitting"
5 <- "standing"
6 <- "lying"

3.
The 3 Test Data sets are being merged column-wise into one dataset called "test_merged"

4. 
The previous steps are being repeated with the "Train Data" which results into a dataset called "train_merged"

5.
The two data sets (train_merged and test_merged) are being merged row-wise into one data set called "test_train"

6.
The features table is being read into R Studio. This table contains descriptive names for the measurements/activies (test_Y and train_Y).
These names are being cleaned up by removing special characters like "(,),-" etc. and those names are being assigned as column names.

7.
Only the measurments that contain the word "mean" or "std" are being extracted from the dataset

8.
An independent tidy data set is created by calculating the mean of each volunteers activity. This data set is exported as a text file in the current working directory.

