Instructions for use
===========================

Please read this to find out how the script in this repository works.

Download the data files from the url below
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip the downloaded file. You will end up with a folder named "getdata-projectfiles-UCI HAR Dataset". In this folder, 
there is a folder named "UCI HAR Dataset," this is where the data is located. 

The script "run_analysis.R" should be located at the same directory as the data folder "UCI HAR Dataset". Run this script 
to generate tidy data.

Script Overview
===========================
The script "run_analysis.R" works on the original downloaded data files. The script will read in the files for Test and 
Training, each having X, Y, Subject and Activity measurements. The Test and Training data is merged together before further 
analysis. The mean and standard deviation is extracted from the merged data. The activities are named and variables are 
named appropriately according to "features.txt". Finally, the average of each variable for the different activities is 
taken per subject.

Results
===========================
Tidy data generate from the script will be output as a text file, named TidyData.txt. 

To import the results into R, use the follwing:
tidy_data <- read.table("TidyData.txt", header = TRUE)
