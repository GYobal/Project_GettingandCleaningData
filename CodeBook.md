
This code book describes the variables,the data, and the work I performed to clean up the data. 



The original data used for this project come from the dataset Human Activity Recognition Using Smartphones Dataset
Version 1.0 (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), created by 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.

the original data contain the measurements corresponding to a series of experiments that the authors carried 
out with a group of 30 volunteers. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data
and 30% the test data. 

The train data has 561 variables and 7,352 records corresponding to 21 subjects and the six activties they performed.
The test data has 561 variables and 2,947 records corresponding to 9 subjects and the six activties they performed.
   
for more information about the original dataset, see README_HumanActivityRecognitionUsingSmartphonesDataset. 
README_HumanActivityRecognitionUsingSmartphonesDataset is a copy of the README.txt found with the original data.

Our data is a subset of the original one.  We merged the test and train datasets using the subjects' unique identification number, 
and kept only 66 variables from the original 561.
  
The subset includes 10,299 records, one variable identifying the subject participating in the experiment, 
one variable identifying the activity, one variable describing the activity and 66 variables measuring 
the mean and standard deviations for 17 features obtained from the Samsung signals for all six activities performed by each subject. 
The 17 features included came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, obtained from the Samsung.
for each pattern: -XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


body and gravity acceleration signals:

tBodyAcc-XYZ

tGravityAcc-XYZ

body linear acceleration and angular velocity were derived in time to obtain Jerk signals:

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm: 

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

a Fast Fourier Transform (FFT) was applied to some of these signals:

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

As explained in the file features_info_originaldataset, measures coming from time domain signals include a prefix 't' to denote time, 
and  the 'f' indicates frequency domain signals.

Note that if a measure did not include both mean and standard deviation we did not include them in this subset.


See the file features_info_originaldataset for more details.

A data dictionary for our two tidy datasets is included below:

The first data set ( test_subset2) include three types of labels: 
-labels starting with V: these were the default result of merging the train and test datasets.  The number following the letter V indicates the 
number of the feature measured as detailed in the file features from the original dataset.
- Var_Label(after Merge): After merging and choosing the variables we were going to include, we rename the variables substituting the 
V labels with  shorter versions of the original names of the variables.
- Var_Label (original): original variables' names 
 

Var_Id  Var_Label(after Merge) Var_Label (original) 
        Subj_ID                 
        Activity_id             
        Activity_Desc           
V1	tBodyAccmean_X	        tBodyAcc-mean()-X
V2	tBodyAccmean_Y	        tBodyAcc-mean()-Y
V3	tBodyAccmean_Z	        tBodyAcc-mean()-Z
V4	tBodyAccstd_X	        tBodyAcc-std()-X
V5	tBodyAccstd_Y	        tBodyAcc-std()-Y
V6	tBodyAccstd_Z	        tBodyAcc-std()-Z
V41	tGravityAccmean_X	tGravityAcc-mean()-X
V42	tGravityAccmean_Y	tGravityAcc-mean()-Y
V43	tGravityAccmean_Z	tGravityAcc-mean()-Z
V44	tGravityAccstd_X	tGravityAcc-std()-X
V45	tGravityAccstd_Y	tGravityAcc-std()-Y
V46	tGravityAccstd_Z	tGravityAcc-std()-Z
V81	tBodyAccJerkmean_X	tBodyAccJerk-mean()-X
V82	tBodyAccJerkmean_Y	tBodyAccJerk-mean()-Y
V83	tBodyAccJerkmean_Z	tBodyAccJerk-mean()-Z
V84	tBodyAccJerkstd_X	tBodyAccJerk-std()-X
V85	tBodyAccJerkstd_Y	tBodyAccJerk-std()-Y
V86	tBodyAccJerkstd_Z	tBodyAccJerk-std()-Z
V121	tBodyGyromean_X	        tBodyGyro-mean()-X
V122	tBodyGyromean_Y	        tBodyGyro-mean()-Y
V123	tBodyGyromean_Z	        tBodyGyro-mean()-Z
V124	tBodyGyrostd_X	        tBodyGyro-std()-X
V125	tBodyGyrostd_Y	        tBodyGyro-std()-Y
V126	tBodyGyrostd_Z	        tBodyGyro-std()-Z
V161	tBodyGyroJerkmean_X	tBodyGyroJerk-mean()-X
V162	tBodyGyroJerkmean_Y	tBodyGyroJerk-mean()-Y
V163	tBodyGyroJerkmean_Z	tBodyGyroJerk-mean()-Z
V164	tBodyGyroJerkstd_X	tBodyGyroJerk-std()-X
V165	tBodyGyroJerkstd_Y	tBodyGyroJerk-std()-Y
V166	tBodyGyroJerkstd_Z	tBodyGyroJerk-std()-Z
V201	tBodyAccMagmean	        tBodyAccMag-mean()
V202	tBodyAccMagstd	        tBodyAccMag-std()
V214	tGravityAccMagmean	tGravityAccMag-mean()
V215	tGravityAccMagstd	tGravityAccMag-std()
V227	tBodyAccJerkMagmean	tBodyAccJerkMag-mean()
V228	tBodyAccJerkMagstd	tBodyAccJerkMag-std()
V240	tBodyGyroMagmean	tBodyGyroMag-mean()
V241	tBodyGyroMagstd	        tBodyGyroMag-std()
V253	tBodyGyroJerkMagmean	tBodyGyroJerkMag-mean()
V254	tBodyGyroJerkMagstd	tBodyGyroJerkMag-std()
V266	fBodyAccmean_X	        fBodyAcc-mean()-X
V267	fBodyAccmean_Y	        fBodyAcc-mean()-Y
V268	fBodyAccmean_Z	        fBodyAcc-mean()-Z
V269	fBodyAccstd_X          	fBodyAcc-std()-X
V270	fBodyAccstd_Y	        fBodyAcc-std()-Y
V271	fBodyAccstd_Z	        fBodyAcc-std()-Z
V345	fBodyAccJerkmean_X	fBodyAccJerk-mean()-X
V346	fBodyAccJerkmean_Y	fBodyAccJerk-mean()-Y
V347	fBodyAccJerkmean_Z	fBodyAccJerk-mean()-Z
V348	fBodyAccJerkstd_X	fBodyAccJerk-std()-X
V349	fBodyAccJerkstd_Y	fBodyAccJerk-std()-Y
V350	fBodyAccJerkstd_Z	fBodyAccJerk-std()-Z
V424	fBodyGyromean_X 	fBodyGyro-mean()-X
V425	fBodyGyromean_Y 	fBodyGyro-mean()-Y
V426	fBodyGyromean_Z 	fBodyGyro-mean()-Z
V427	fBodyGyrostd_X  	fBodyGyro-std()-X
V428	fBodyGyrostd_Y  	fBodyGyro-std()-Y
V429	fBodyGyrostd_Z  	fBodyGyro-std()-Z
V503	fBodyAccMagmean 	fBodyAccMag-mean()
V504	fBodyAccMagstd  	fBodyAccMag-std()
V516	fBodyBodyAccJerkMagmean	fBodyBodyAccJerkMag-mean()
V517	fBodyBodyAccJerkMagstd	fBodyBodyAccJerkMag-std()
V529	fBodyBodyGyroMagmean	fBodyBodyGyroMag-mean()
V530	fBodyBodyGyroMagstd	fBodyBodyGyroMag-std()
V542	fBodyBodyGyroJerkMagmean fBodyBodyGyroJerkMag-mean()
V543	fBodyBodyGyroJerkMagstd	 fBodyBodyGyroJerkMag-std()


The Second Tidy Dataset (tidy_HumanActivityRecognition_Average) includes 180 rows and 69 variables. 

The variables are the averages of all the selected measurements for each activity performed by each subject, 
so the names changed, but correspond to the previous 69 measures:

Var_Label(Average of 
measurements)           Var_Label (original)
Subj_ID                 
Activity_id             
Activity_Desc
AvgtBodyAccmean_X	tBodyAcc-mean()-X
AvgtBodyAccmean_Y	tBodyAcc-mean()-Y
AvgtBodyAccmean_Z	tBodyAcc-mean()-Z
AvgtBodyAccstd_X	tBodyAcc-std()-X
AvgtBodyAccstd_Y	tBodyAcc-std()-Y
AvgtBodyAccstd_Z	tBodyAcc-std()-Z
AvgtGravityAccmean_X	tGravityAcc-mean()-X
AvgtGravityAccmean_Y	tGravityAcc-mean()-Y
AvgtGravityAccmean_Z	tGravityAcc-mean()-Z
AvgtGravityAccstd_X	tGravityAcc-std()-X
AvgtGravityAccstd_Y	tGravityAcc-std()-Y
AvgtGravityAccstd_Z	tGravityAcc-std()-Z
AvgtBodyAccJerkmean_X	tBodyAccJerk-mean()-X
AvgtBodyAccJerkmean_Y	tBodyAccJerk-mean()-Y
AvgtBodyAccJerkmean_Z	tBodyAccJerk-mean()-Z
AvgtBodyAccJerkstd_X	tBodyAccJerk-std()-X
AvgtBodyAccJerkstd_Y	tBodyAccJerk-std()-Y
AvgtBodyAccJerkstd_Z	tBodyAccJerk-std()-Z
AvgtBodyGyromean_X	tBodyGyro-mean()-X
AvgtBodyGyromean_Y	tBodyGyro-mean()-Y
AvgtBodyGyromean_Z	tBodyGyro-mean()-Z
AvgtBodyGyrostd_X	tBodyGyro-std()-X
AvgtBodyGyrostd_Y	tBodyGyro-std()-Y
AvgtBodyGyrostd_Z	tBodyGyro-std()-Z
AvgtBodyGyroJerkmean_X	tBodyGyroJerk-mean()-X
AvgtBodyGyroJerkmean_Y	tBodyGyroJerk-mean()-Y
AvgtBodyGyroJerkmean_Z	tBodyGyroJerk-mean()-Z
AvgtBodyGyroJerkstd_X	tBodyGyroJerk-std()-X
AvgtBodyGyroJerkstd_Y	tBodyGyroJerk-std()-Y
AvgtBodyGyroJerkstd_Z	tBodyGyroJerk-std()-Z
AvgtBodyAccMagmean	tBodyAccMag-mean()
AvgtBodyAccMagstd	tBodyAccMag-std()
AvgtGravityAccMagmean	tGravityAccMag-mean()
AvgtGravityAccMagstd	tGravityAccMag-std()
AvgtBodyAccJerkMagmean	tBodyAccJerkMag-mean()
AvgtBodyAccJerkMagstd	tBodyAccJerkMag-std()
AvgtBodyGyroMagmean	tBodyGyroMag-mean()
AvgtBodyGyroMagstd	tBodyGyroMag-std()
AvgtBodyGyroJerkMagmean	tBodyGyroJerkMag-mean()
AvgtBodyGyroJerkMagstd	tBodyGyroJerkMag-std()
AvgfBodyAccmean_X	fBodyAcc-mean()-X
AvgfBodyAccmean_Y	fBodyAcc-mean()-Y
AvgfBodyAccmean_Z	fBodyAcc-mean()-Z
AvgfBodyAccstd_X	fBodyAcc-std()-X
AvgfBodyAccstd_Y	fBodyAcc-std()-Y
AvgfBodyAccstd_Z	fBodyAcc-std()-Z
AvgfBodyAccJerkmean_X	fBodyAccJerk-mean()-X
AvgfBodyAccJerkmean_Y	fBodyAccJerk-mean()-Y
AvgfBodyAccJerkmean_Z	fBodyAccJerk-mean()-Z
AvgfBodyAccJerkstd_X		fBodyAccJerk-std()-X
AvgfBodyAccJerkstd_Y		fBodyAccJerk-std()-Y
AvgfBodyAccJerkstd_Z		fBodyAccJerk-std()-Z
AvgfBodyGyromean_X		fBodyGyro-mean()-X
AvgfBodyGyromean_Y		fBodyGyro-mean()-Y
AvgfBodyGyromean_Z		fBodyGyro-mean()-Z
AvgfBodyGyrostd_X		fBodyGyro-std()-X
AvgfBodyGyrostd_Y		fBodyGyro-std()-Y
AvgfBodyGyrostd_Z		fBodyGyro-std()-Z
AvgfBodyAccMagmean		fBodyAccMag-mean()
AvgfBodyAccMagstd		fBodyAccMag-std()
AvgfBodyBodyAccJerkMagmean	fBodyBodyAccJerkMag-mean()
AvgfBodyBodyAccJerkMagstd	fBodyBodyAccJerkMag-std()
AvgfBodyBodyGyroMagmean	        fBodyBodyGyroMag-mean()
AvgfBodyBodyGyroMagstd	        fBodyBodyGyroMag-std()
AvgfBodyBodyGyroJerkMagmean	fBodyBodyGyroJerkMag-mean()
AvgfBodyBodyGyroJerkMagstd	fBodyBodyGyroJerkMag-std()


I created a R script called run_analysis.R that does the following:

 
1. I Merged the training and the test sets to create one data set called test_merge. 
2. I Extracted only the measurements on the mean and standard deviation for each measurement and save them in a dataset called test_subset2. 
3. I Used descriptive activity names to name the activities in the data sets test_merge and test_subset2.
4. I Appropriately labeled the data set test_subset2 with descriptive variable names. 
5. From the data set in step 4, I created a second, independent tidy data set with the average of each variable 
   for each activity and each subject called tidy_HumanActivityRecognition_Average.
    -I re-labeled the data set tidy_HumanActivityRecognition_Average with descriptive variable names with the prefix 'avg'.

**Note: I kept in both datasets the activity_id and the activity_description because sometimes 
  it is easier to deal with the number ids than with the descriptions, especially if you need to go back to the original datasets to corroborate something.
    
     
   