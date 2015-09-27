Here I explained how all of the scripts work and how they are connected.

The purpose of this project is to generate two sets of tidy Data created from the wearable computing database from the following Source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, 
ESANN 2013. Bruges, Belgium 24-26 April 2013. 


1. To Merge the training and the test sets to create one data set and to uses descriptive activity names to name the activities
  in the data set , I made the following

Using read.table and colnames, I read the activity labels from a revised version from the file activity_labels.txt, where the descriptors and the numbers
were reshaped to create two columns, with names Activity_id and Activity_Desc respectively.  


Also using read.table and colnames, I read the subject numbers--there are 30 of them but 30% are part of the test datasets
and 70% are part of the train datasets. First, I worked with the datasets corresponding to the test group.  The process was similar with
the train datasets.

Using sqldf, I tested that the distinct number of individuals is ok and check dimensions of the file.
 

After, I Read all the measures of the test group participants: a total of 561 variables for 9 individuals, with measurements
for each of the six activities studie, and  read all activities identification for each row of the x_test file above.


I joined the activity labels with the previous file using an inner join.  The variable used for the join was
Activity_id


Finally, I created an Index for the participants and their activities per row, and used cbind to create a file with the index, suject Id, the 
66 measures and the labels of the activities. The name of the file is s_test_merge. 

The index was used  to merge correctly 
the train and test datasets,and to corroborate that the rows were not altered after the merge.


Next, I made the same steps with the train datasets.  The name  of the resulting dataset is s_train_merge.

Finally, I joined s_test_merge and s_train_merge using intersect and the function merge.  The file name is test_merge.

I tested the resulting dataset using dim(), head(), tail(), and sqldf


2. To extract only the measurements on the mean and standard deviation for each measurement
 
To save ONLY the variables that measure MEANS  AND STD DEVIATIONS: I only chose the variables that have
BOTH measurements of mean and standard deviation, for a total of 66 variables, plus three: subj_id, Activity_Id and Activity_Desc.
The file's name is test_subset2, and its dimensions are 10299 rows and 69 variables (columns).  
I relabeled the variables as required in step 4 of the project.


3. Appropriately labels the data set with descriptive variable names


For the purpose of relabeling, I used EXCEl to generate new labels and add quotes and commas around the variable names.   
I substituted the default variables in the R script with a variation of the names coming from the features_info.txt.  

I changed the names in the following way: the mean()- and std()- were eliminated and diminished to a more amicable variable
just identifying the general variable, its dimension and if it is a mean or a standard deviation (include x,y and z in the name as needed).


For example: 

the variable tGravityAcc-mean()-Y became 'V42', and I renamed it as tGravityAccmean_Y.  In this way, the name is shorter and less
cumbersome to deal with for our purposes, although for other type of analysis the longer name maybe more useful.
 	
4. From the first tidy data set , create a second, independent tidy data set with the AVERAGE of each variable 
   for each activity and each subject

  To obtain a second tidy dataset for the average of each measurement and activity per subject, I used the following command from 
dplyr using a combination of summarize for each variable, with a suggestion from the Discussion forums and stackflow to use %>%.
What the function %>% does is to pass the Left Hand Size to the first argument of the Right Hand Size.  The name of the second tidy dataset is 
tidy_HumanActivityRecognition_Average.  The dimensions are 180 rows and 69 columns.

Again, notice that I relabeled the variables, adding the prefix 'Avg' to indicate that the measurement is the average of the
original measurements. 

For example:
 
As we saw before, the variable tGravityAcc-mean()-Y was renamed tGravityAccmean_Y.
Now, the variable was renamed after the average calculation as AvgtGravityAccmean_Y.

--------------------------------------------------------------------------------------------------------------------\
---------------------------------------------------------------------------------------------------------------------\
The REPO includes the following files:

1. tidy_HumanActivityRecognition_Average.txt: file with the second tidy data set.

2. R script titled: run_analysis.R to obtain both tidy datasets from the original data obtained from 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

3. CodeBook.MD : include more details about the variables, labels and measurements of the project, and the work done to clean data.

and two text files that reproduced the original text files README.txt and Features_info.txt from the 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The purpose is to make easier for the review to find
detailed information if needed.

4. README_HumanActivityRecognitionUsingSmartphonesDataset

5. features_info_originaldataset





 
