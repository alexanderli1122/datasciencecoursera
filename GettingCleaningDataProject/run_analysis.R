#Required packages
install.packages("dplyr","reshape2")
library(dplyr)
library(reshape2)
#Download & unzip file. Sets your working directory to the folder containing data
Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.files(Url,destfile="projectdata.zip",method=curl)
unzip(zipfile="projectdata.zip",exdir = "projectdata")
setwd("./projectdata")

#Creates initial placeholders for data
testdata<-c()
traindata<-c()

#Gets you into the test folder to merge files into one dataframe
setwd("./test")
for (f in c("subject_test.txt","y_test.txt","X_test.txt")){
  read.table(f)->tmp
  testdata<-c(testdata,tmp)
}
as.data.frame(testdata)->testdataframe

#Moves directory into the main directory
setwd("..")

#Sets directory to train folder & merge files into one dataframe
setwd("./train")
for (f in c("subject_train.txt","y_train.txt","X_train.txt")){
  read.table(f)->tmp
  traindata<-c(traindata,tmp)
}
as.data.frame(traindata)->traindataframe

#Sets directory to main directory
setwd("..")

#Merge datainto one dataframe
full_join(testdataframe,traindataframe)->testtraindata

#Name the columns properly
c("ID","Activity")->firsttwocolumns
readLines("features.txt")->columnnames
colnames(testtraindata)<-c(firsttwocolumns,columnnames)

#Label the activities
testtraindata$Activity<-factor(testtraindata$Activity,labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

#Build dataframe of ID and Activity for means
melt(testtraindata,id=c("ID","Activity"),measure.vars = columnnames)->testtrainmelt
dcast(testtrainmelt,ID+Activity~variable,mean)->IDActivityMean