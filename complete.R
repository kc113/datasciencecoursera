# This function returns the number of complete cases in the files in a directory.
# It takes 2 arguments: 'directory',  'id'
# 'directory' is a character vector of length 1 indicating the location of files.
# 'id' is an integer vector indicating the monitor ID numbers
# Return a data frame of the form
# id  nobs
# 1   117
#...

complete = function(directory, id = 1:332){
  #create empty vector
  nobs = c()
  #loop through the files to read data
  for(i in id){
    file_name = paste(directory, sprintf("%03d%s", i, ".csv"), sep = "/")
    poll_data = read.csv(file_name)
    nobs = c(nobs, sum(complete.cases(poll_data)))
  }
  #return the data frame
  data.frame(id = id, nobs = nobs)
}