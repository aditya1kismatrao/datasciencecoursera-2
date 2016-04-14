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


# Codebook

* Each row in the dataset represents a combination of the activity variable and the subject variable. Since there are 6 activity variables and 30 subject variables, we get 180 rows in the dataset. The 
runanalysis.R outputs a dataframe stored in the variable "data_avg" representing this dataset. The row names are formed from the activity and subject entries separated by an underscore. Ex - WALKING_1, STANDING_22.

* Each column in the data set is same as in the pevious dataset representing the various features.

* Each Entry in the dataset gives the corresponding average value for the particular feature according to the activity and subject.