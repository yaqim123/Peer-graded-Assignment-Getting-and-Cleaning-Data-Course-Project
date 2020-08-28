# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

1. 0 Merges the training and the test sets to create one data set.

2.0 Extracts only the measurements on the mean and standard deviation for each measurement.


3.0 Uses descriptive activity names to name the activities in the data set


4.0 Appropriately labels the data set with descriptive variable names.


5.0 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The following analysis will complete all the task above

a) Firstly the data is read using read.table for features, activity_labels, x_train, y_train as well as subject train using read.table function. The names of the variables are change accordingly here to ease the process later. This is also done for test datasets

b) Secondly, we need to subset the columns which only contains mean as well as standard deviation for both train and test using grep function. 

c) The train data set is then merge together with the activity data as well as subjects using cbind. This is also done for test.

d) the activity descriptive name are then combine with the data using left_join function for both train and test

e) From here the data can be merge together for train and test using rbind function. Here we have completed the task for, 1.0,2.0,3.0 as well as 4.0

f) The last part we summarise the data for average of each variable on activity and subjects using summarise_all function in dplyr

Done.

The code book is available
