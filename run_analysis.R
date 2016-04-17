## Reading into R the datasets.
trainData<-read.table("Y_train.txt")
testData<-read.table("Y_test.txt")
## Merging the 2 datasets with rowbind.
totalData<-rbind(testData,trainData)
print(dim(totalData))

## Step two Extracting the average and std col's.
features<-read.table("features.txt")
meanStdfeatures<-grep("-(mean|std)\\(\\)",features[,2])
totalDataExtracts<-totalData[,meanStdfeatures]

## Step three var labels.
varNames<-features[meanStdfeatures]
colnames(totalDataExtracts)<-varNames[,2]

## Step 4 label activities.
subjFiletest<-read.table("subject_test.txt")
subjFiletrain<-read.table("subject_train.text")
subjData<-rbind(subjFiletest,subjFiletrain)

actTest<-read.table("y_test.txt")
actTrain<-read.table("y_train.txt")
actData<-rbind(actTest,actTrain)
allTogether<-cbind(actData,subjData,totalDataExtracts)
colnames(allTogether)[1]<-"Activities"
colnames(allTogether)[2]<-"Person"

## Add appropiate activity names.
for ( i in 1:length(allTogether$Activities)){ 
          if(allTogether$Activities[i]==1){allTogether$Activities[i]<-"WALKING"
        } else if(allTogether$Activities[i]==2){allTogether$Activities[i]<-"WALKING_UPSTAIRS"
        } else if(allTogether$Activities[i]==3){allTogether$Activities[i]<-"WALKING_DOWNSTAIRS"
        } else if(allTogether$Activities[i]==4){allTogether$Activities[i]<-"SITTING"
        } else if(allTogether$Activities[i]==5){allTogether$Activities[i]<-"STANDING"
        } else{allTogether$Activities[i]<-"LAYING"
        }
}
print(allTogether[1:5,1:7])

## Final second dataset.
tidyDataset<-ddply(allTogether,.(Activities,Person), function(x) colMeans(x[,3:68]))
print(finalDataset[1:5,1:8])
write.table(tidyDataset,file="tidyDataset.txt",row.name=FALSE)

