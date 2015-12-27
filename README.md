## Getting and Cleaning Data Course Project

## Assumptions:
### 1) Assumes "UCI HAR Dataset" is already downloaded. Othrwise, we can use download.file package the download the zip file.
### 2) Assumes "UCI HAR Dataset" directory is in the current working directory.

## In the prelimanary step, Reads training and test datasets
### Load labels from "UCI HAR Dataset" directory
### Load training dataset
### Load test dataset

## STEP 1: Merges the training and the test sets to create one data set.
### Row bind training and test datasets
### name the columns
### merge the data

## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
### Find columns wit Mean, Std, Activity and Subject
### extract the data fo the abive required columns

## STEP 3: Uses descriptive activity names to name the activities in the data set
### Convert "Activity" column from number to character
### Replace the activity number with activity name
### Factor the activity & subject columns

## STEP 4: Appropriately labels the data set with descriptive variable names. 

## STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### Create a tidy data set with average for each activity and subject.
### Order the tidy dataset
### Write tidy data to a file

## Variables:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## TidyData Variables

> names(tidyData)
 [1] "Subject"                                          
 [2] "Activity"                                         
 [3] "TimeBodyAccelerometerMean()-X"                    
 [4] "TimeBodyAccelerometerMean()-Y"                    
 [5] "TimeBodyAccelerometerMean()-Z"                    
 [6] "TimeBodyAccelerometerSTD()-X"                     
 [7] "TimeBodyAccelerometerSTD()-Y"                     
 [8] "TimeBodyAccelerometerSTD()-Z"                     
 [9] "TimeGravityAccelerometerMean()-X"                 
[10] "TimeGravityAccelerometerMean()-Y"                 
[11] "TimeGravityAccelerometerMean()-Z"                 
[12] "TimeGravityAccelerometerSTD()-X"                  
[13] "TimeGravityAccelerometerSTD()-Y"                  
[14] "TimeGravityAccelerometerSTD()-Z"                  
[15] "TimeBodyAccelerometerJerkMean()-X"                
[16] "TimeBodyAccelerometerJerkMean()-Y"                
[17] "TimeBodyAccelerometerJerkMean()-Z"                
[18] "TimeBodyAccelerometerJerkSTD()-X"                 
[19] "TimeBodyAccelerometerJerkSTD()-Y"                 
[20] "TimeBodyAccelerometerJerkSTD()-Z"                 
[21] "TimeBodyGyroscopeMean()-X"                        
[22] "TimeBodyGyroscopeMean()-Y"                        
[23] "TimeBodyGyroscopeMean()-Z"                        
[24] "TimeBodyGyroscopeSTD()-X"                         
[25] "TimeBodyGyroscopeSTD()-Y"                         
[26] "TimeBodyGyroscopeSTD()-Z"                         
[27] "TimeBodyGyroscopeJerkMean()-X"                    
[28] "TimeBodyGyroscopeJerkMean()-Y"                    
[29] "TimeBodyGyroscopeJerkMean()-Z"                    
[30] "TimeBodyGyroscopeJerkSTD()-X"                     
[31] "TimeBodyGyroscopeJerkSTD()-Y"                     
[32] "TimeBodyGyroscopeJerkSTD()-Z"                     
[33] "TimeBodyAccelerometerMagnitudeMean()"             
[34] "TimeBodyAccelerometerMagnitudeSTD()"              
[35] "TimeGravityAccelerometerMagnitudeMean()"          
[36] "TimeGravityAccelerometerMagnitudeSTD()"           
[37] "TimeBodyAccelerometerJerkMagnitudeMean()"         
[38] "TimeBodyAccelerometerJerkMagnitudeSTD()"          
[39] "TimeBodyGyroscopeMagnitudeMean()"                 
[40] "TimeBodyGyroscopeMagnitudeSTD()"                  
[41] "TimeBodyGyroscopeJerkMagnitudeMean()"             
[42] "TimeBodyGyroscopeJerkMagnitudeSTD()"              
[43] "FrequencyBodyAccelerometerMean()-X"               
[44] "FrequencyBodyAccelerometerMean()-Y"               
[45] "FrequencyBodyAccelerometerMean()-Z"               
[46] "FrequencyBodyAccelerometerSTD()-X"                
[47] "FrequencyBodyAccelerometerSTD()-Y"                
[48] "FrequencyBodyAccelerometerSTD()-Z"                
[49] "FrequencyBodyAccelerometerMeanFreq()-X"           
[50] "FrequencyBodyAccelerometerMeanFreq()-Y"           
[51] "FrequencyBodyAccelerometerMeanFreq()-Z"           
[52] "FrequencyBodyAccelerometerJerkMean()-X"           
[53] "FrequencyBodyAccelerometerJerkMean()-Y"           
[54] "FrequencyBodyAccelerometerJerkMean()-Z"           
[55] "FrequencyBodyAccelerometerJerkSTD()-X"            
[56] "FrequencyBodyAccelerometerJerkSTD()-Y"            
[57] "FrequencyBodyAccelerometerJerkSTD()-Z"            
[58] "FrequencyBodyAccelerometerJerkMeanFreq()-X"       
[59] "FrequencyBodyAccelerometerJerkMeanFreq()-Y"       
[60] "FrequencyBodyAccelerometerJerkMeanFreq()-Z"       
[61] "FrequencyBodyGyroscopeMean()-X"                   
[62] "FrequencyBodyGyroscopeMean()-Y"                   
[63] "FrequencyBodyGyroscopeMean()-Z"                   
[64] "FrequencyBodyGyroscopeSTD()-X"                    
[65] "FrequencyBodyGyroscopeSTD()-Y"                    
[66] "FrequencyBodyGyroscopeSTD()-Z"                    
[67] "FrequencyBodyGyroscopeMeanFreq()-X"               
[68] "FrequencyBodyGyroscopeMeanFreq()-Y"               
[69] "FrequencyBodyGyroscopeMeanFreq()-Z"               
[70] "FrequencyBodyAccelerometerMagnitudeMean()"        
[71] "FrequencyBodyAccelerometerMagnitudeSTD()"         
[72] "FrequencyBodyAccelerometerMagnitudeMeanFreq()"    
[73] "FrequencyBodyAccelerometerJerkMagnitudeMean()"    
[74] "FrequencyBodyAccelerometerJerkMagnitudeSTD()"     
[75] "FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()"
[76] "FrequencyBodyGyroscopeMagnitudeMean()"            
[77] "FrequencyBodyGyroscopeMagnitudeSTD()"             
[78] "FrequencyBodyGyroscopeMagnitudeMeanFreq()"        
[79] "FrequencyBodyGyroscopeJerkMagnitudeMean()"        
[80] "FrequencyBodyGyroscopeJerkMagnitudeSTD()"         
[81] "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()"    
[82] "Angle(TimeBodyAccelerometerMean,Gravity)"         
[83] "Angle(TimeBodyAccelerometerJerkMean),GravityMean)"
[84] "Angle(TimeBodyGyroscopeMean,GravityMean)"         
[85] "Angle(TimeBodyGyroscopeJerkMean,GravityMean)"     
[86] "Angle(X,GravityMean)"                             
[87] "Angle(Y,GravityMean)"                             
[88] "Angle(Z,GravityMean)" 
