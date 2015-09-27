#Date: 9/26/2015

#Tidy Data created from wearable computing database from the following Source:
#Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
#A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
#21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, 
#ESANN 2013. Bruges, Belgium 24-26 April 2013. 
#The purpose of this script is to obtain a tidy dataset as requested in the course project.


setwd("C:/Users/laboybulancea/Desktop/Coursera/GettingandCleaningData/PROJECT")

getwd()


install.packages("plyr")
library(plyr)

install.packages("dplyr")
library(dplyr)


install.packages("sqldf")

library('sqldf')


#First, read the activity labels from a revised version from the file, where the descriptors and the numbers
#reshaped in the text file to create two columns, with names Activity_id and Activity_Desc.  
#See codeBook for definitions


activity_Label <- read.table("./activity_labelsRev.txt")
colnames(activity_Label) <- c("Activity_id","Activity_Desc")
names(activity_Label)

#Read the subject numbers--there are 30 of them but 30% are part of the test datasets and 70% are part of the
#train datasets. First, I will work with the datasets corresponding to the test group.  

subj_test <-read.table("./subject_test.txt")
colnames(subj_test) <- c("Subj_Id")

#test distinct number of individuals is ok and check dimensions of the file.

sqldf("select distinct Subj_Id from subj_test") 

#Read all the measures of the test group participants: a total of 561 variables for 9 individuals, with measurements
#for each of the six activities studied

x_test <-read.table("./x_test.txt")

# read all activities identification for each row of the x_test file above

y_test <-read.table("./y_test.txt")
colnames(y_test) <- c("Activity_id")
#add description of activity

# join the activity labels with the previous file using an inner join.  The variable used for the jon was
#Activity_id

y_test_wLabel <-join(y_test, activity_Label,
                     type = "inner")

head(y_test_wLabel)
tail(y_test_wLabel)

#create Index for the participants and their activities per row.

Seq_1 <-seq(1,2947)

s_test_merge<-cbind(Seq_1,subj_test,x_test,y_test_wLabel)

#Tests
head(s_test_merge)
tail(s_test_merge)

str(s_test_merge)

dim(s_test_merge)

sqldf("select Subj_Id,  Activity_Desc, count(Activity_id) as count_Activities from s_test_merge group by Subj_Id,Activity_Desc ")


##Next, I did the same steps with the train datasets

subj_train <-read.table("./subject_train.txt")
colnames(subj_train) <- c("Subj_Id")

x_train <-read.table("./x_train.txt")
y_train <-read.table("./y_train.txt")
colnames(y_train) <- c("Activity_id")

y_train_wLabel <-join(y_train, activity_Label,
                     type = "inner")

head(y_train)
head(y_train_wLabel)

#create Index

Seq_1 <-seq(2948,10299)

s_train_merge<-cbind(Seq_1,subj_train,x_train,y_train_wLabel)

head(s_train_merge)
tail(s_train_merge)

str(s_train_merge)
dim(s_train_merge)

sqldf("select Subj_Id,  Activity_Desc, count(Activity_id) as count_Activities from s_train_merge group by Subj_Id,Activity_Desc ")

##Next step--to join the datasets together as requested in the project (step #1)

intersect(names(s_test_merge),names(s_train_merge))
test_merge = merge(s_test_merge,s_train_merge,all=TRUE) 

dim(test_merge)
str(test_merge)

##Few additional Tests
sqldf("select Subj_Id,  Activity_id, Activity_Desc, count(Activity_id) as count_Activities from test_merge group by Subj_Id,Activity_id,Activity_Desc ")

sqldf("select distinct Subj_Id from test_merge") 

sqldf("select distinct Activity_id, Activity_Desc from test_merge
       order by Activity_id") 


#Now, I need to save ONLY the variables required or to rename the variables and filter them by name

#nOW, CHOOSE THE VARIABLES THAT ARE RELATED TO mEANS AND STD DEVIATIONS.  I only chose the variables that have
# both measurements of mean and standard deviation, for a totla of 66 variables, plues three: subj_id, Activity_Id and Activity_Desc


test_subset2 <- test_merge[,c("Subj_Id","Activity_id","Activity_Desc","V1",  "V2",  "V3",	"V4",	"V5",	"V6",	"V41",	"V42",	"V43",	"V44",	"V45",	"V46",	"V81",	"V82",	"V83",	"V84",	"V85",	"V86",	"V121",	"V122",	"V123",	"V124",	"V125",	"V126",	"V161",	"V162",	"V163",	"V164",	"V165",	"V166",	"V201",	"V202",	"V214",	"V215",	"V227",	"V228",	"V240",	"V241",	"V253",	"V254",	"V266",	"V267",	"V268",	"V269",	"V270",	"V271",	"V345",	"V346",	"V347",	"V348",	"V349",	"V350",	"V424",	"V425",	"V426",	"V427",	"V428",	"V429",	"V503",	"V504",	"V516",	"V517",	"V529",	"V530",	"V542",	"V543")]

#I used EXCEl to put the " " quotes around the variable names and variables defined in the 
#features_info dataset, and substituted into the function below
#the names were changed in the following way: the mean()- and std()- were eliminated and diminished to a more amicable variable
#just identifying the general variable, its dimension and if it is a mean or a standard deviation


names(test_subset2) <- c("Subj_Id","Activity_id","Activity_Desc","tBodyAccmean_X",  "tBodyAccmean_Y",	"tBodyAccmean_Z",	"tBodyAccstd_X",	"tBodyAccstd_Y",	"tBodyAccstd_Z",	"tGravityAccmean_X",	"tGravityAccmean_Y",	"tGravityAccmean_Z",	"tGravityAccstd_X",	"tGravityAccstd_Y",	"tGravityAccstd_Z",	"tBodyAccJerkmean_X",	"tBodyAccJerkmean_Y",	"tBodyAccJerkmean_Z",	"tBodyAccJerkstd_X",	"tBodyAccJerkstd_Y",	"tBodyAccJerkstd_Z",	"tBodyGyromean_X",	"tBodyGyromean_Y",	"tBodyGyromean_Z",	"tBodyGyrostd_X",	"tBodyGyrostd_Y",	"tBodyGyrostd_Z",	"tBodyGyroJerkmean_X",	"tBodyGyroJerkmean_Y",	"tBodyGyroJerkmean_Z",	"tBodyGyroJerkstd_X",	"tBodyGyroJerkstd_Y",	"tBodyGyroJerkstd_Z",	"tBodyAccMagmean",	"tBodyAccMagstd",	"tGravityAccMagmean",	"tGravityAccMagstd",	"tBodyAccJerkMagmean",	"tBodyAccJerkMagstd",	"tBodyGyroMagmean",	"tBodyGyroMagstd",	"tBodyGyroJerkMagmean",	"tBodyGyroJerkMagstd",	"fBodyAccmean_X",	"fBodyAccmean_Y",	"fBodyAccmean_Z",	"fBodyAccstd_X",	"fBodyAccstd_Y",	"fBodyAccstd_Z",	"fBodyAccJerkmean_X",	"fBodyAccJerkmean_Y",	"fBodyAccJerkmean_Z",	"fBodyAccJerkstd_X",	"fBodyAccJerkstd_Y",	"fBodyAccJerkstd_Z",	"fBodyGyromean_X",	"fBodyGyromean_Y",	"fBodyGyromean_Z",	"fBodyGyrostd_X",	"fBodyGyrostd_Y",	"fBodyGyrostd_Z",	"fBodyAccMagmean",	"fBodyAccMagstd",	"fBodyBodyAccJerkMagmean",	"fBodyBodyAccJerkMagstd",	"fBodyBodyGyroMagmean",	"fBodyBodyGyroMagstd",	"fBodyBodyGyroJerkMagmean",	"fBodyBodyGyroJerkMagstd"
)

names(test_subset2)
dim(test_subset2)

head(test_subset2, n= 3)
tail(test_subset2, n= 3)

sqldf("select Subj_Id,  Activity_id, Activity_Desc, count(Activity_id) as count_Activities from test_subset2 group by Subj_Id,Activity_id,Activity_Desc
       ")

##What the function %>% does is to pass the LHS to the first argument of the RHS

tidy_HumanActivityRecognition_Average <-test_subset2 %>% group_by(Subj_Id,Activity_id, Activity_Desc) %>% summarise_each(funs(mean))

##Rename the Variables with descriptive names--Actually, keep the names changed in the tyidy data set and 
##change the name of the final file to include average 

#Rename with the averages

names(tidy_HumanActivityRecognition_Average) <- c("Subj_Id","Activity_id","Activity_Desc","AvgtBodyAccmean_X",  "AvgtBodyAccmean_Y",	"AvgtBodyAccmean_Z",	"AvgtBodyAccstd_X",	"AvgtBodyAccstd_Y",	"AvgtBodyAccstd_Z",	"AvgtGravityAccmean_X",	"AvgtGravityAccmean_Y",	"AvgtGravityAccmean_Z",	"AvgtGravityAccstd_X",	"AvgtGravityAccstd_Y",	"AvgtGravityAccstd_Z",	"AvgtBodyAccJerkmean_X",	"AvgtBodyAccJerkmean_Y",	"AvgtBodyAccJerkmean_Z",	"AvgtBodyAccJerkstd_X",	"AvgtBodyAccJerkstd_Y",	"AvgtBodyAccJerkstd_Z",	"AvgtBodyGyromean_X",	"AvgtBodyGyromean_Y",	"AvgtBodyGyromean_Z",	"AvgtBodyGyrostd_X",	"AvgtBodyGyrostd_Y",	"AvgtBodyGyrostd_Z",	"AvgtBodyGyroJerkmean_X",	"AvgtBodyGyroJerkmean_Y",	"AvgtBodyGyroJerkmean_Z",	"AvgtBodyGyroJerkstd_X",	"AvgtBodyGyroJerkstd_Y",	"AvgtBodyGyroJerkstd_Z",	"AvgtBodyAccMagmean",	"AvgtBodyAccMagstd",	"AvgtGravityAccMagmean",	"AvgtGravityAccMagstd",	"AvgtBodyAccJerkMagmean",	"AvgtBodyAccJerkMagstd",	"AvgtBodyGyroMagmean",	"AvgtBodyGyroMagstd",	"AvgtBodyGyroJerkMagmean",	"AvgtBodyGyroJerkMagstd",	"AvgfBodyAccmean_X",	"AvgfBodyAccmean_Y",	"AvgfBodyAccmean_Z",	"AvgfBodyAccstd_X",	"AvgfBodyAccstd_Y",	"AvgfBodyAccstd_Z",	"AvgfBodyAccJerkmean_X",	"AvgfBodyAccJerkmean_Y",	"AvgfBodyAccJerkmean_Z",	"AvgfBodyAccJerkstd_X",	"AvgfBodyAccJerkstd_Y",	"AvgfBodyAccJerkstd_Z",	"AvgfBodyGyromean_X",	"AvgfBodyGyromean_Y",	"AvgfBodyGyromean_Z",	"AvgfBodyGyrostd_X",	"AvgfBodyGyrostd_Y",	"AvgfBodyGyrostd_Z",	"AvgfBodyAccMagmean",	"AvgfBodyAccMagstd",	"AvgfBodyBodyAccJerkMagmean",	"AvgfBodyBodyAccJerkMagstd",	"AvgfBodyBodyGyroMagmean",	"AvgfBodyBodyGyroMagstd",	"AvgfBodyBodyGyroJerkMagmean",	"AvgfBodyBodyGyroJerkMagstd")

#Test is the function keeping the order? ok

sqldf("select distinct Subj_Id,  Activity_id, Activity_Desc
        from test_subset2 group by Subj_Id,  Activity_id")

dim(tidy_HumanActivityRecognition_Average)

tidy_HumanActivityRecognition_Average <- tidy_HumanActivityRecognition_Average

write.table(tidy_HumanActivityRecognition_Average, "tidy_HumanActivityRecognition_Average.txt", row.name=FALSE)


##Test suggested in the Discussion Forums: ok
df <- read.table("tidy_HumanActivityRecognition_Average.txt", header = TRUE)
View(df)

# the end
