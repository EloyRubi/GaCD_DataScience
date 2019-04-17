library(reshape2)
filename <- "dataset.zip"

# Download and unzip
if (!file.exists(filename)){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileUrl, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Load labels and features
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
actLabels[,2] <- as.character(actLabels[,2])
features[,2] <- as.character(features[,2])

#Data on mean and std
featuresList <- grep("mean|std", features[,2])
featuresList.names <- features[featuresList, 2]
featuresList.names = gsub('-mean', 'Mean', featuresList.names)
featuresList.names = gsub('-std', 'Std', featuresList.names)
featuresList.names <- gsub('[-()]', '', featuresList.names)


#Load datasets

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresList]
testAct<- read.table("UCI HAR Dataset/test/Y_test.txt")
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt")

train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresList]
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")


test <- cbind(testSub, testAct, test)
train <- cbind(trainSub, trainAct, train)

#Merge test and train, change variable names

trainTest <- rbind(train,test)
colnames(trainTest) <- c("subject", "activity", featuresList.names)

#Subjects and Activities into factors

trainTest$subject <- as.factor(trainTest$subject)
trainTest$activity <- factor(trainTest$activity, levels = actLabels[,1], labels = actLabels[,2])

#Melt and dcast for step 5 of the assignment

trainTest.melted <- melt(trainTest, id = c("subject", "activity"))
trainTest.mean <- dcast(trainTest.melted, subject + activity ~ variable, mean)

write.table(trainTest.mean, "tidyData.txt", row.names = FALSE, quote = FALSE)

