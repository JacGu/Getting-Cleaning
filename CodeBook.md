
--- title: "CodeBook"
 author: Jac Gu
 date: April 16, 2016 
 output: md_document
---

## CodeBook
#  Getting / Cleaning assignment Week 4.
The -finalDataset- is a tidy skinny dataset.
Every row contains a one value for every variable.

The variable ACTIVITIES are, WALKING,WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS,SITTING,STANDING and LAYING.
The subjects who executed these experiments are 30 persons.

The units of the calculated value MEAN's are time in sec and frequency in herz. 

First the X_test and X_train files are read into R.
Merged with rbind to 1 dataset.

Next the measurements with Mean and Std columns are extracted.

In step three the features textfile is read into R.
With the names of the features the column names are set.

In step four the textfile with the subjects and the activities 
are read in. With cbind merged together to the complete dataset. The descriptive activitie names are set.

In the last step an independent second tidy dataset is created with the average calculated for each variable,each activity and each subject.


