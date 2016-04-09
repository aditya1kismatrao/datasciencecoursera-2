source("pollutantmean.R")

complete <- function(directory, id=1:332){
    
    data <- get_all_data(directory, id)

    com_df <- data.frame(id=integer(), nobs=integer())
    # don't know why not working.
    names(com_df) <- c("id","nobs")

    k <- !is.na(data[[2]]) & !is.na(data[[3]])
    
    data <- data[k,]

    for(i in id){
        com_df <- rbind(com_df, c(i, sum(data[[4]] == i)))
    }

    return(com_df)
}

#set.seed(42)
#cc<-complete("specdata", 332:1)
#use <- sample(332, 10)
#print(cc[use, "nobs"])
#complete("specdata", c(304,311,95,274,211,170,241,44,213,228))
#complete("specdata", 30:25)
#complete("specdata", 3)