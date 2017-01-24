Each test and train folder includes the following data:
=======================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Codebook:
=========

## Feature Vectors
Features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Time domain signals are prefixed 't' to denote time; frequency domain signals are prefixed with 'f'. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Acceleration signals are separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ), with units being standard gravity unit 'g'. 

Body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Again, note that the 'f' indicates frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
mean(): Mean value

- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
-min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors

As not all data given in the dataset were used, only those appearing in the final dataset were listed. The following descriptions refer to columns in the final tidy data submitted as har_tidy.txt file.

## Subject
There are 30 subjects who performed all the activities, with their IDs ranging from 1 to 30. 

## Activity
The 6 activities done by all 30 subjects include: laying, sitting, standing, walking, walking_downstairs, and walking_upstairs.

## Varname (Variable Name)
These are the feature variables listed in the featurelist, with 561 characters. In the final dataset, only the ones of interest (i.e. ones with mean and standard deviation) were included: 
- BodyAcc: body acceleration signal
- BodyAccJerk: body acceleration jerk signal 
- BodyAccJerkMag: magnitude of body acceleration jerk signal
- BodyBodyAccJerkMag: ?same as above
- BodyBodyGyroJerkMag: magnitude of jerk signal for angular velocity vector measured by the gyroscope
- BodyBodyGyroMag: magnitude of angular velocity signal
- BodyGyro: angular velocity signal
- BodyGyroJerk: angular velocity jerk signal
- BodyGyroJerkMag: Magnitude of angular velocity jerk signal 
- BodyGyroMag: magnitude of angular velocity signal
- GravityAcc: gravitational acceleration signal
- GravityAccMag: magnitude of gravitational accelaration signal

## Dimension
This includes the 3 axis, namely X, Y and Z axes. 

## Measurement
There are 2 measurements of the variables listed above: time and/or frequency domains. 

## Statistic 
Dataset includes either the mean, or standard deviation. 

## Value
Units for the values are either one of the following:
- Anything with acceleration-related variables have standard gravity unit 'g'.
- Anything with angular velocity-related variables have a unit of radians/second. 
