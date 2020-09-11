# This function calculates the correlation between sulfate and nitarate for 
# locations where number of complete cases > threshold
# It takes 2 arguments: 'directory',  'threshold'
# 'directory' is a character vector of length 1 indicating the location of files.
# 'threshold' is a numeric vector of length 1 indicating the threshold value for
# complete cases.

corr = function(directory, threshold = 0){
  # create empty numeric vector
  corr = numeric()
  # loop through the files to read data and compute correlations
  for(i in 1:332){
    file_name = paste(directory, sprintf("%03d%s", i, ".csv"), sep = "/")
    poll_data = read.csv(file_name)
    
    if (sum(complete.cases(poll_data)) > threshold) {
      poll_data_com = poll_data[complete.cases(poll_data),]
      corr = c(corr, cor(poll_data_com[['sulfate']], poll_data_com[['nitrate']]))
    }
  }
  # return the correlations  
  corr
}