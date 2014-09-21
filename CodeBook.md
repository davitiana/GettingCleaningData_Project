This is the code book for the "run_analysis.R" script.
===========================

DATA
====
The data for this script was collected from a Samsung Galaxy S smartphone's accelerometer and gyroscope 3-axial raw signals
. Time domain signals (denoted with a prefix 't') were captured and then filtered. A Fast Fourier Transform (FFT) was also 
applied to some of the signals (denoted with a prefix 'f').

There were 30 users from whom this data was collected as they performed various activities. The data is presented over the 
X, and Y axis, and includes the user (subject) number and the activity which they were performing (activity label). Each 
data set is collected over either testing periods or training periods.

Activity data is read in as "activity_labels". Features data are read in as "features". Test data for X, Y and Subject is 
read in as "test_subject_data", "test_x_data", "test_y_data". Training data is similarly read in as "train_subject_data", 
"train_x_data", and "train_y_data".

VARIABLES
=========
The variables in the original data set are described in "features.txt" file. The variables for which testing and training 
data were collected are either from the accelerometer's or gyro's data, collecting mean, standard deviation, etc. The 30 
users are also variables, called "Subject". The activities over which the data was collected are also variables, called 
"Activity", and described in the detail in "activity_labels.txt".

The "run_analysis.R" script generates the following variables for the tidy set for the 30 subjects performing different 
activities, descripted in "activity_labels.txt". The variables below correspond to the mean and standard deviation 
extracted from the original data set collected from accelerometer and gyroscope data.

[1]  "Subject"                                        
[2]  "Activity"                                      
[3]  "Time BodyAccelerometerMeanX"                    
[4]  "Time BodyAccelerometerMeanY"                   
[5]  "Time BodyAccelerometerMeanZ"                    
[6]  "Time GravityAccelerometerMeanX"                
[7]  "Time GravityAccelerometerMeanY"                 
[7]  "Time GravityAccelerometerMeanZ"                
[9]  "Time BodyAccelerometerJerkMeanX"                
[10] "Time BodyAccelerometerJerkMeanY"               
[11] "Time BodyAccelerometerJerkMeanZ"                
[12] "Time BodyGyroMeanX"                            
[13] "Time BodyGyroMeanY"                             
[14] "Time BodyGyroMeanZ"                            
[15] "Time BodyGyroJerkMeanX"                         
[16] "Time BodyGyroJerkMeanY"                        
[17] "Time BodyGyroJerkMeanZ"                         
[18] "Time BodyAccelerometerMagMean"                 
[19] "Time GravityAccelerometerMagMean"               
[20] "Time BodyAccelerometerJerkMagMean"             
[21] "Time BodyGyroMagMean"                           
[22] "Time BodyGyroJerkMagMean"                      
[23] "Frequency BodyAccelerometerMeanX"               
[24] "Frequency BodyAccelerometerMeanY"              
[25] "Frequency BodyAccelerometerMeanZ"               
[26] "Frequency BodyAccelerometerMeanFreqX"          
[27] "Frequency BodyAccelerometerMeanFreqY"           
[28] "Frequency BodyAccelerometerMeanFreqZ"          
[29] "Frequency BodyAccelerometerJerkMeanX"           
[30] "Frequency BodyAccelerometerJerkMeanY"          
[31] "Frequency BodyAccelerometerJerkMeanZ"           
[32] "Frequency BodyAccelerometerJerkMeanFreqX"      
[33] "Frequency BodyAccelerometerJerkMeanFreqY"       
[34] "Frequency BodyAccelerometerJerkMeanFreqZ"      
[35] "Frequency BodyGyroMeanX"                        
[36] "Frequency BodyGyroMeanY"                       
[37] "Frequency BodyGyroMeanZ"                        
[38] "Frequency BodyGyroMeanFreqX"                   
[39] "Frequency BodyGyroMeanFreqY"                    
[40] "Frequency BodyGyroMeanFreqZ"                   
[41] "Frequency BodyAccelerometerMagMean"             
[42] "Frequency BodyAccelerometerMagMeanFreq"        
[43] "Frequency BodyBodyAccelerometerJerkMagMean"     
[44] "Frequency BodyBodyAccelerometerJerkMagMeanFreq"
[45] "Frequency BodyBodyGyroMagMean"                  
[46] "Frequency BodyBodyGyroMagMeanFreq"             
[47] "Frequency BodyBodyGyroJerkMagMean"              
[48] "Frequency BodyBodyGyroJerkMagMeanFreq"         
[49] "Time BodyAccelerometerStdDevX"                  
[50] "Time BodyAccelerometerStdDevY"                 
[51] "Time BodyAccelerometerStdDevZ"                  
[52] "Time GravityAccelerometerStdDevX"              
[53] "Time GravityAccelerometerStdDevY"               
[54] "Time GravityAccelerometerStdDevZ"              
[55] "Time BodyAccelerometerJerkStdDevX"              
[56] "Time BodyAccelerometerJerkStdDevY"             
[57] "Time BodyAccelerometerJerkStdDevZ"              
[58] "Time BodyGyroStdDevX"                          
[59] "Time BodyGyroStdDevY"                           
[60] "Time BodyGyroStdDevZ"                          
[61] "Time BodyGyroJerkStdDevX"                       
[62] "Time BodyGyroJerkStdDevY"                      
[63] "Time BodyGyroJerkStdDevZ"                       
[64] "Time BodyAccelerometerMagStdDev"               
[65] "Time GravityAccelerometerMagStdDev"             
[66] "Time BodyAccelerometerJerkMagStdDev"           
[67] "Time BodyGyroMagStdDev"                         
[68] "Time BodyGyroJerkMagStdDev"                    
[69] "Frequency BodyAccelerometersTime dX"            
[70] "Frequency BodyAccelerometersTime dY"           
[71] "Frequency BodyAccelerometersTime dZ"            
[72] "Frequency BodyAccelerometerJerksTime dX"       
[73] "Frequency BodyAccelerometerJerksTime dY"        
[74] "Frequency BodyAccelerometerJerksTime dZ"       
[75] "Frequency BodyGyrosTime dX"                     
[76] "Frequency BodyGyrosTime dY"                    
[77] "Frequency BodyGyrosTime dZ"                     
[78] "Frequency BodyAccelerometerMagsTime d"         
[79] "Frequency BodyBodyAccelerometerJerkMagsTime d"  
[80] "Frequency BodyBodyGyroMagsTime d"              
[81] "Frequency BodyBodyGyroJerkMagsTime d"          

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
formula "mean" for average. The results of this is a new tidy data set. This new tidy data is output to a file named 
"TidyData.txt".

