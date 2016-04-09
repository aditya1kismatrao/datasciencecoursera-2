source("complete.R")

all_data <- complete('specdata')

write.csv(file='all_data.csv', x=all_data)