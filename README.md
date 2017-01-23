JLee - Getting & Cleaning Data Final Assignment
===============================================
Author: Joan Lee
Date Created: Jan 21, 2017


## Description of Data
Data comprises experiments on 30 volunteers between 19 and 48 years of age. Each person performed 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) with a smartphone attached on the waist. The dataset is available at this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Brief Description on run_analysis.R Script
The `run_analysis.R` script aims to do the following:
- Merge the training and test data sets into one data set;
- Extract only measurements on mean and standard deviation for each measurement;
- Use descriptive activity names for the activities in the data set;
- Label the dataset with descriptive variable names appropriately;
- Create a second independent tidy data set with the average of each variable for each activity for each subject. 

Summarized steps:
* The first part of the assignment requires cleaning up the data. Two custom functions were created to clean fixed width data.
* Then the variables of interest (mean and standard deviation) were extracted. 
* Read in the feature list, then activity list, followed by the data sets. 
* Rename the datasets with appropriate labels and make it more presentable.
* Combine the data, and the first dataset is saved as har_cleaned.txt file. 
* The second part of tidy data involves parsing the first dataset into narrow form of tidy data, saved as har_tidy.txt file. 

## Other notes
This script requires dplyr and reshape2 packages.
It also requires the UCI HAR Dataset to be stored in working directory. 
More detailed descriptions of the script is found in the `run_analysis.R` script itself. 




