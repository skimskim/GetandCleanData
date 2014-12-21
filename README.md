run_analysis downloads a data set collected from the accelerometers of the 
Samsung Galaxy S smartphone. 

The data set is available from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
along with more documentation can be found in the website.

The function returns a tidy data in a long format of all measurements with a 
mean or standard deviation in its measurement segregated by subject and the
activity of the subject. The function returns of mean of the each measurement
along the subject and activity permutation. 

First, the fuction downloads the data file from the website and unzips the necessary files.
Second, all the relevant tables are read into the R.
Then, the training data and testing data are merged into one dataset along with the subject and activity data, as well as the variable names.
Then, dlpyr package and reshape2 is used to melt the data into tidy data. Finally, ddply function is used to find the mean for each subject and activity permutation along each variable measurements.
