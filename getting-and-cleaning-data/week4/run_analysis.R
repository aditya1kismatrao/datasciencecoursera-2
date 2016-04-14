
# This function gets the required column names and 
# appropriately labels the data set with descriptive variable names. 
get_column_names <- function(){
    file_dest <- "UCI HAR Dataset/features.txt"
    features <- read.table(file_dest, colClasses = 'character')
    features <- features[[2]]
    features
}

column_names <- get_column_names()


# This function creates the required data set from the data available
# by merging the train and test data set in appropriate manner.
create_dataset <- function(){

    data_type <- c("train", "test")
    
    df <- matrix(0, ncol=563, nrow=0)
    df <- data.frame(df)
    colnames(df) <- c("subject", column_names, "activity")
    
    for(dt in data_type){
        file_url <- paste0("UCI HAR Dataset/", dt, "/")
        d1 <- read.table(paste0(file_url, 'subject_', dt, '.txt'),
                         row.names = NULL,
                         col.names = 'subject')
        d2 <- read.table(paste0(file_url, 'X_', dt, '.txt'),
                         row.names = NULL,
                         col.names = column_names)
        d3 <- read.table(paste0(file_url, 'y_', dt, '.txt'),
                         row.names = NULL,
                         col.names = 'activity')
        d <- cbind(d1, d2, d3)
        df <- rbind(df, d)
    }
    df
}

data <- create_dataset()


# This function extracts only the measurements on the mean and standard
# deviation for each measurement.
get_mean_std <- function(){
    r <- grepl("mean|std", colnames(data))
    data_mean_std <- data[, r]
    data_mean_std
}

data_mean_std <- get_mean_std()


# This function uses descriptive activity names to name the activities
# in the data set.
give_activity_names <-  function(){
    act_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                             colClasses = "character")
    data$activity <<- act_labels[[2]][as.integer(data$activity)]
}

give_activity_names()

# This function creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
get_avg_activity_subject <- function(){
    f <- as.factor(interaction(data$activity, data$subject, sep='_'))
    m <- as.data.frame(apply(data[,c(-1,-563)], 2,
                             function(x) tapply(x, f, mean)))
    m
}

data_avg <- get_avg_activity_subject()
print(data_avg)
