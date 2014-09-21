Instructions for use
===========================

Please read this to find out how the analysis script in this repository works.

Download the data files from the url below
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip the downloaded file. You will end up with a folder named "getdata-projectfiles-UCI HAR Dataset". In this folder, 
there is a folder named "UCI HAR Dataset," this is where the data is located. 

The script "run_analysis.R" should be located at the same directory as the data folder "UCI HAR Dataset". Run this script 
to generate tidy data.

Analysis Overview
===========================
The script "run_analysis.R" works on the original downloaded data files, collected from a Samsung Galaxy S smartphone's 
accelerometer and gyroscope 3-axial raw signals. The script will read in the files for Test and Training, each having X, Y, 
Subject and Activity measurements. The Test and Training data is merged together before further analysis, called "test_trai
n_merged". Next, the mean and standard deviation is extracted from the merged data, called "std_mean_data". Only features 
ending in "-mean" or "-std" are considered for this step. Next, the activities are named referencing the "activity_labels
.txt" as an enumeration (factor), named "activity_enum_data". Variables are also named appropriately according to "features
.txt". The features names are cleaned up for easier use, removing non-alphanumeric characters and giving the time and 
frequency data more descriptive names. This cleaned up data is merged into "merged_std_mean_data". Next, the average of 
each variable (feature) is taken for the different activities performed per subject, called "avg_data_per_subject". This is 
our final tidy data set.

Results
===========================
Tidy data generated from the script will be output as a text file, named TidyData.txt. 

To import the results into R, use the follwing:
tidy_data <- read.table("TidyData.txt", header = TRUE)
