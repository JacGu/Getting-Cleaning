## Merging the trainData set and the testData set.
## Reading into R the local datasets.
trainData<-read.table("trainDataset.txt")
testData<-read.table("testDataset.txt")
## Merging the 2 datasets with rowbind.
totalData<-rbind(trainData,testData)
print(dim(totalData))

## Step two Extracting the average and SD.
## First, set column names for activity and persons.
colnames(totalData)[1]<-"act"
colnames(totalData[2]<-"pers"
## For oversight I did a sort here, on 1.act and 2.pers.
totalDataSorted <- totalData %>% arrange(act,pers)

## Mean and SD.
sortedMeandataset <-totalDataSorted %>% rowwise() %>% mutate(average=mean(c(V1:V128)))
meanPlusSddata <-sortedMeandataset %>% rowwise() %>% mutate(stdeviation=sd(c(V1,V2,V3,V4,V5,V6,V7,V8,V9,V10)))
print(meanPlusSddata[1:5,127:132])

## Extracting.
neatData <- select(meanPlusSddata,act,pers,average,stdeviation)
neatData[1:5,]
## Add the activity names.
for ( i in 1:length(neatData$act)){ 
          if(neatData$act[i]==1){neatData$act[i]<-"WALKING"
        } else if(neatData$act[i]==2){neatData$act[i]<-"WALKING_UPSTAIRS"
        } else if(neatData$act[i]==3){neatData$act[i]<-"WALKING_DOWNSTAIRS"
        } else if(neatData$act[i]==4){neatData$act[i]<-"SITTING"
        } else if(neatData$act[i]==5){neatData$act[i]<-"STANDING"
        } else{neatData$act[i]<-"LAYING"
        }
}
print(neatData[1:5,]

## Appropiate variable names.
colnames(neatData) <- c("ACTIVITY","PERSON","AVERAGE","STDEVIATION")
print(neatData[1:5,1:4])

## Final second dataset.
finalDataset <- select(neatData,ACTIVITY,PERSON,AVERAGE)
print(finalDataset[1:5,])
print(finalDataset[92686:92691,])


