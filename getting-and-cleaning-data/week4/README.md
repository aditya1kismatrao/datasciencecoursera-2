# Script

The script **run_analysis.R** comprises the following functions - 

* ### ***get_column_names***
This function gets the required column names and appropriately labels the data set with descriptive variable names.

* ### ***create_dataset***
This function creates the required data set from the data available by merging the train and test data set in appropriate manner.

* ### ***get_mean_std***
This function extracts only the measurements on the mean and standard deviation for each measurement.

* ### ***give_activity_names***
This function uses descriptive activity names to name the activities in the data set.

* ### ***get_avg_activity_subject***
This function creates a second, independent tidy data set with the average of each variable for each activity and each subject.