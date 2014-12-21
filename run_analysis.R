##  run_analysis downloads a data set collected from the accelerometers of the 
##  Samsung Galaxy S smartphone. 
##  The data set is available from 
##  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##  along with more documentation can be found in the website.
##
##  The function returns a tidy data in a long format of all measurements with a 
##  mean or standard deviation in its measurement segregated by subject and the
##  activity of the subject. The function returns of mean of the each measurement
##  along the subject and activity permutation. 

run_analysis <- function () {
        ## Download file and unzip download into local drive.
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        install.packages("downloader"); library(downloader)
        download(url, destfile = './data.zip')
        unzip ("data.zip", exdir ="./XYZ")
        
        
        ## Read measured data set along with subject_id and activity_id.
        ## Read descriptive names of variable measurements.
        train<-read.table("./XYZ/UCI HAR Dataset/train/X_train.txt", 
                          header=F, sep="")
        test <-read.table("./XYZ/UCI HAR Dataset/test/X_test.txt", 
                          header=F,sep="")
        
        subject_train <- read.table("./XYZ/UCI HAR Dataset/train/subject_train.txt", 
                                    header=F,sep="")
        subject_test <- read.table("./XYZ/UCI HAR Dataset/test/subject_test.txt", 
                                   header=F,sep="")
        
        act_train <- read.table("./XYZ/UCI HAR Dataset/train/y_train.txt", 
                                header=F,sep="")
        act_test <- read.table("./XYZ/UCI HAR Dataset/test/y_test.txt", 
                               header=F,sep="")
        act_levels <- read.table("./XYZ/UCI HAR Dataset/activity_labels.txt", 
                                 header=F,sep="")
        
        features <- read.table("./XYZ/UCI HAR Dataset/features.txt", 
                               header=F, sep=" ")
         
        ## Merge training data set and test data set.
        super_data <- rbind(train, test)
        super_act <- rbind(act_train, act_test)
        super_subject <- rbind(subject_train, subject_test)
        
        ## Subset data measuring either mean or std.
        ## Appends the subset data with the variable names.
        mean_std <- grepl("mean", features[,2]) | grepl("std", features[,2])
        data_meanstd <- super_data[,mean_std]
        colnames(data_meanstd) <- features[mean_std,2]
        
        ## Check subsetted data for NA values.
        NG <- is.na(data_meanstd)
        if (sum(NG) != 0) {stop("There is a NA in the data set.")}
        
        ## Change activity_id to description of activity
        super_act <- as.matrix(super_act)
        super_act <- factor(super_act, levels=act_levels[,1] , labels=act_levels[,2])
        
        ## Bind subject data, activity data and mean&std data set.
        DATA <- cbind(super_subject, super_act, data_meanstd)
        colnames(DATA)[1:2]<- c("Subject", "Activity")
        
        ## Tidy up the data set in long format by subject and activity.
        library(dplyr); library(reshape2)
        DD <- tbl_df(DATA)
        final <- length(colnames(DATA))
        melt_data <- melt(DATA, id = colnames(DATA)[1:2], 
                          measure.vars = colnames(DATA)[3:final])
        cleanDD <- ddply(melt_data,c("Subject", "Activity", "variable"), 
                    summarize, mean.variable=mean(value))
        write.table(cleanDD, file = "clean_data.txt", row.names=FALSE) 
}

