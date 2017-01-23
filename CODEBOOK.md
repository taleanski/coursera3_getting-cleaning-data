Each test and train folder includes the following data:
=======================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Codebook:
=========

As not all data given in the dataset were used, only those appearing in the final dataset were listed. Following descriptions refer to columns in the final tidy data submitted as har_tidy.txt file.

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
