run_analysis <- function()
{
   library(plyr)
   library(reshape2)

   ################################# READ IN DATA ###############################################
   # Read activity labels and features
   activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
   features <- read.table("UCI HAR Dataset/features.txt")
   
   # Test data
   test_subject_data <- read.table("UCI HAR Dataset/test/subject_test.txt")
   test_x_data <- read.table("UCI HAR Dataset/test/X_test.txt")
   test_y_data <- read.table("UCI HAR Dataset/test/y_test.txt")   
   
   # Training data
   train_subject_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
   train_x_data <- read.table("UCI HAR Dataset/train/X_train.txt")
   train_y_data <- read.table("UCI HAR Dataset/train/y_train.txt")   
   
   ########################### MERGE TEST AND TRAINING DATA ##################################
   
   # Merge x, y and subject data for test and training
   x_merged <- rbind(train_x_data, test_x_data)
   subject_merged <- rbind(train_subject_data, test_subject_data)  
   y_merged <- rbind(train_y_data, test_y_data)   
   
   # Merged test and training data
   test_train_merged <- mutate(x_merged, v562 = subject_merged, v563 = y_merged)
   colnames(test_train_merged[,562]) <- "v562"
   colnames(test_train_merged[,563]) <- "v563"

   ########################### EXTRACT MEAN AND STD DEV #######################################
   
   # Extract mean and standard deviation of each measurement
   # Only features with -mean or -std at the end of their names are considered
   features_col_names <- as.character(features[,2])   
   mean_cols <- grep(c("-mean"), features_col_names)
   std_dev_cols <- grep(c("-std"), features_col_names)
   mean_data <- x_merged[,mean_cols]
   std_dev_data <- x_merged[,std_dev_cols]
   std_mean_data <- cbind(mean_data, std_dev_data) 

   ############################ NAME ACTIVITIES IN THE DATA ###################################
   
   # Name the activities in the data set
   # First turn activity labels into an enumerated type (factors)
   activity_enum_data <- factor(y_merged[,1], levels = activity_labels[,1], labels = activity_labels[,2])
   merged_std_mean_data <- cbind(std_mean_data, subject_merged, "Activity" = activity_enum_data)
    
   ################################# LABEL VARIABLES NAMES ###################################
   
   # Clean up the variable names in the Features column
   # Variables starting with t are Time, variables starting with f are Frequency
   # Remove non-alphanumeric variables
   # Replace mean/std/acc with Mean/StdDev/Accelerometer
   col_names <- c(features_col_names[mean_cols], features_col_names[std_dev_cols])
   tidy_time_col_names <- sub("t", "Time ", col_names)
   tidy_time_freq_col_names <- sub("f", "Frequency ", tidy_time_col_names)
   tidy_paren_dash_col_names <- gsub("\\(|\\)|\\-", "", tidy_time_freq_col_names)
   tidy_capital_mean_col_names <- sub("mean", "Mean", tidy_paren_dash_col_names)
   tidy_capital_std_col_names <- sub("std", "StdDev", tidy_capital_mean_col_names)
   tidy_acc_col_names <- sub("Acc", "Accelerometer", tidy_capital_std_col_names)
   col_names_tidy <- tidy_acc_col_names
   
   # Label the variable names
   names(merged_std_mean_data) <- c(col_names_tidy, "Subject", "Activity")
   
   ###################### CREATE A SECOND DATA SET WITH AVERAGES #############################
   
   # Create tiday data set with the average of each variable for each activity and each subject
   merged_data_per_subject <- melt(merged_std_mean_data, id=c("Subject","Activity"))
   avg_data_per_subject <- dcast(merged_data_per_subject, Subject + Activity ~ variable, mean)   
   
   # Save the tiday data set
   write.table(avg_data_per_subject, "TidyData.txt", row.name=FALSE)
   
}
   