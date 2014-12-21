Synopsis of Variable Measurements 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    mean and standard deviation(std) for each measurements:
(1) tBodyAcc-X
(2)         -Y
(3)         -Z

(4) tGravityAcc-X
(5)            -Y
(6)            -Z
               
(7) tBodyAccJerk-X
(8)             -Y
(9)             -Z
                
(10) tBodyGyro-X
(11)          -Y
(12)          -Z
              
(13) tBodyGyroJerk-X
(14)              -Y
(15)              -Z

(16) tBodyAccMag

(17) tGravityAccMag

(18) tBodyAccJerkMag

(19) tBodyGyroMag

(20) tBodyGyroJerkMag

(21) fBodyAcc-X
(22)         -Y
(23)         -Z

(24) fBodyAccJerk-X
(25)             -Y
(26)             -Z

(27) fBodyGyro-X
(28)          -Y
(29)          -Z

(30) fBodyAccMag

(31) fBodyAccJerkMag

(32) fBodyGyroMag

(33) fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
