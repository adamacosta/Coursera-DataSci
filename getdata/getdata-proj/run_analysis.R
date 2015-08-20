library(dplyr)
options(stringsAsFactors=F)

## download and unzip the file to data directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl,destfile="data.zip",method="curl")
unzip("data.zip",exdir="data")

setwd("data/UCI HAR Dataset")

## read in the training data
subjectTrain <- read.table("train/subject_train.txt")
labelsTrain <- read.table("train/y_train.txt")
measurementsTrain <- read.table("train/X_train.txt")

## create activity labels
labelsTrain[labelsTrain==1] <- "WALKING"
labelsTrain[labelsTrain==2] <- "WALK_UP"
labelsTrain[labelsTrain==3] <- "WALK_DN"
labelsTrain[labelsTrain==4] <- "SITTING"
labelsTrain[labelsTrain==5] <- "STANDING"
labelsTrain[labelsTrain==6] <- "LAYING"

## create table of all training data
train <- cbind(subjectTrain,labelsTrain,measurementsTrain)

## read in the test data
subjectTest <- read.table("test/subject_test.txt")
labelsTest <- read.table("test/y_test.txt")
measurementsTest <- read.table("test/X_test.txt")

## create activity labels
labelsTest[labelsTest==1] <- "WALKING"
labelsTest[labelsTest==2] <- "WALK_UP"
labelsTest[labelsTest==3] <- "WALK_DN"
labelsTest[labelsTest==4] <- "SITTING"
labelsTest[labelsTest==5] <- "STANDING"
labelsTest[labelsTest==6] <- "LAYING"

## create table of all training data
test <- cbind(subjectTest,labelsTest,measurementsTest)

## merge training and test sets 
data <- rbind(test,train)

## name the columns
names <- c("ID","act",read.table("features.txt")[,2])
names <- make.names(names)
names(data) <- names

## subset to find only the means and standard deviations
subset <- c(grep("mean",names),grep("std",names))
data <- data[,c(1,2,subset)]

## sort by ID
data <- arrange(data,ID)

## find the mean of each column by ID and activity
clean <- data.frame(matrix(ncol=81,nrow=180))
setnames(clean,c("ID","act",names[subset]))
acts <- c("STANDING","SITTING","LAYING","WALKING","WALK_UP","WALK_DN")

## this loop populates the pre-allocated final data.frame
k <- 1
for (i in 1:30) {
     for (j in acts) {
          clean[k,] <- c(i,j,unname(colMeans(select(filter(data,ID==i&act==j),-(1:2)))))
          k <- k + 1
     }
}

## use regex string match and replace support to make names more human readable
setnames(clean,gsub("\\.","",names(clean)))
setnames(clean,gsub("\\mean","Mean",names(clean)))
setnames(clean,gsub("\\std","Std",names(clean)))
write.table(clean,file="../../clean.txt",sep='\t',quote=F,row.names=F)