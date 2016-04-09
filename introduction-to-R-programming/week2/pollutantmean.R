get_all_data <- function(directory, id=1:332){

    setwd(directory)
    file_names <- dir(pattern='.csv')
    
    data <- NULL
    
    for(i in id){
        
        file_data = read.csv(file_names[i])
        data <- rbind(data, file_data)
        
    }
    
    setwd('..')
    return(data)
}


pollutantmean <- function(directory, pollutant, id=1:332){
    
    
    data <- get_all_data(directory, id)
    
    if(pollutant == 'sulfate'){
        nut_id <- 2
    }else{ nut_id <- 3}
    
    mean(data[data[[4]] %in% id,][[nut_id]], na.rm = TRUE)
    
}

#pollutantmean("specdata", "sulfate", 1:10)
#pollutantmean("specdata", "nitrate", 70:72)
#pollutantmean("specdata", "nitrate")