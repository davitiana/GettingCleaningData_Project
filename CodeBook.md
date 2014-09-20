This is the code book for the Getting and Cleaning Data course project, "run_analysis.R" script.
===========================

DATA
====
The data for this script was collected from a Samsung Galaxy S smartphone's accelerometer and gyroscope. There were 30 
users from whom this data was collected as they performed various activities. The data is presented over the X, and Y axis, 
and includes the user (subject) number and the activity which they were performing (activity label). Each data set is 
collected over either testing periods or training periods.

Activity data is read in as "activity_labels". Features data are read in as "features". Test data for X, Y and Subject is 
read in as "test_subject_data", "test_x_data", "test_y_data". Training data is similarly read in as "train_subject_data", 
"train_x_data", and "train_y_data".

VARIABLES
=========
The variables in this data set are described in "features.txt" file. The variables for which testing and training data were 
collected are either from the accelerometer's or gyro's data, collecting mean, standard deviation, etc. The 30 users are 
also variables, called "Subject". The activities over which the data was collected are also variables, called "Activity", 
and described in the detail in "activity_labels.txt".

TRANSFORMATIONS
===============
The data collected is first read into the script, as described above in the DATA section. The data collected on the X axis 
for testing and training is merged together and named "x_merged". The data for Y axis is merged as "y_merged", and subject 
data is named "subject_merged". Data is then joined over all variables from testing and training per subject and per 
activity, named "test_train_merged". The picture in the link below demonstrates the merged data set:

(http://imgur.com/jsv8jsR)
Credit: David Hood, community TA. 
(https://class.coursera.org/getdata-007/forum/thread?thread_id=49)

Once the test and training data is merged, the mean and standard deviation of each measurement is extracted from the 
features variables, called "mean_data" and "std_dev_data". Only features variables considered are those with "-mean" or "
-std" anywhere in the name of the variable. The data is put together for mean and standard deviation and called "std_mean_d
ata".

With the data merged, we would like to have a descriptive way to name the Activity variable. The "activity_labels.txt" file 
describes which activities are performed. An enumeration, or factor, is performed on the Activity, where first column is 
the enumeration and second column is the descriptive activity. The Activity column in the merged data set is replaced with 
the descriptive enumeration per activity.

We would also like to name the Features variables in a descriptive way. The "features.txt" file contains the descriptions 
for each feature variable. The second column in the file is the description per variable. This information is read in as 
characters and column headers for Features are replaced with this information, called "features_col_names". This data is 
cleaned up for the final tidy data set as follows: a) Replace "t" with Time; b) Replace "f" with Frequency; c) Remove all 
"()" and "-" that are not alphanumeric characters; d) Capitalize Mean and StdDev for mean and standard deviation; e) 
Replace "AcC" with "Accelerometer". With variable names cleaned up, we use "col_names_tidy" for the features variables, and 
add Subject and Activity column names for the subject and activity labels.

Once the merged data is appropriately described and labeled, we want to take the average of each variable for each activity
,per subject. This data is contained in "avg_data_per_subject" using "dcast" with variales "Subject" and "Activity", and 
formula "mean" for average. 

A new tidy data set is created and output to a file named "TidyData.txt".

