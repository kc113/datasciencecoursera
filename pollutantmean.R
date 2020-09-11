# This function calculates the mean of a pollutant across a specified list of 
# monitors.
# It takes 3 arguments: 'directory', 'pollutant', 'id'
# 'directory is a character vector of length 1 indicating the location of files.
# 'pollutant' is a character vector of length 1 indicating the pollutant
# 'id' is an integer vector indicating the monitor ID numbers

pollutantmean = function(directory, pollutant, id = 1:332){
  #empty vector to store the pollutant values
  poll_val = c()
  #loop through the files to read data
  for(i in id){
    file_name = paste(directory, sprintf('%03d%s', i, '.csv'), sep = '/')
    poll_data = read.csv(file_name)
    poll_val = c(poll_val, poll_data[[pollutant]])
  }
  #find the mean of pollutant
  mean(poll_val, na.rm = TRUE)
}