
--- title: "CodeBook"
 author: Jac Gu
 date: April 16, 2016 
 output: md_document
---

## CodeBook
#  Getting / Cleaning assignment Week 4.
The -finalDataset- is a tidy skinny dataset.
Every row contains a value for all the variables.

The variable ACTIVITIES are, WALKING,WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS,SITTING,STANDING and LAYING.
The 30 persons who executed these experiments, gathered 128
readings during a 2.56 sec time window.
These 128 readings are not shown anymore in the -finalDataset-

The unit of the calculated value MEAN is Hz,frequency. 

The X-Y-Z measurements of the accelerometer and the gyrometer,the Y-test with all activities, and the subject-test table with the executing persons, are put together in 1 dataset called -testData-. The same is true for the training group with the -trainData-.  
Both are read into R and merged with rbind in -totalData-.
Which consist of the columns "activities","persons", and the 128 columns V1,V2....V128 with the readings during the time window of 2.56 sec.
In step 2 are the mean and the sd calculated.
-totalData- is now also sorted on resp. activities, persons and is now called -totalDataSorted-.
-neatData- is extracted with the requested columns, activities, persons, mean and sd.
In the next step the activity numbers are replaced by their resp activitynames. 
In the last step -finalDataset- is selected. 


