source("complete.R")
source("pollutantmean.R")

corr <- function(directory, threshold=0){

    
    data <- read.csv('all_data.csv')
    vector_list <- data[[2]][data[[3]]>threshold]
    data <- get_all_data(directory, vector_list)
    
    k <- !is.na(data[[2]]) & !is.na(data[[3]])
    data <- data[k,]
    print(data)
    
    ret_cor <- c()
    
    for(i in vector_list){
        file_data <- data[data[[4]] == i,]
        ret_cor <- c(ret_cor, cor(file_data[[2]], file_data[[3]]))
    }
    
    return(ret_cor)
    
} 

cr <- corr("specdata", 2000)

n<-length(cr)
cr <- corr("specdata", 1000)
cr<-sort(cr)
print(c(n, round(cr,4)))