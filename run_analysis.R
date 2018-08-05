#================================================================
#1. Merges the training and the test sets to create one data set.
#================================================================

setwd("C:/Users/Administrator/Documents/coursera/getting and cleaning data/UCI HAR Dataset")

subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/x_train.txt")
y_train <- read.table("./train/y_train.txt")

test_merge <- cbind("subject"=subject_test, "activity"=y_test, X_test )
train_merge <- cbind("subject"=subject_train, "activity"=y_train, X_train )
total_merge <- rbind(test_merge, train_merge)

#colnames(total_merge) <- c("category", "subject", features[, 2], "activity" )

#==========================================================================================
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#==========================================================================================

#extract_features <- grepl("category|subject|Y|mean|std", colnames(total_merge))

features <- read.table("features.txt", as.is = TRUE)
extract_features <- grep("mean|std", features[,2]) + 2
total_merge <- cbind(total_merge[, c(1,2)], total_merge[, extract_features])

#==========================================================================================
#3. Uses descriptive activity names to name the activities in the data set
#==========================================================================================

activity_labels <- read.table("activity_labels.txt")
total_merge$V1.1 <- factor(total_merge$V1.1, activity_labels[,1], activity_labels[,2])

#==========================================================================================
#4. Appropriately label the data set with descriptive variable names
#==========================================================================================

features$V2 <- gsub("[()]", "", features$V2)
colnames(total_merge) <- c("subject", "activity", features[extract_features, ]$V2)

#==========================================================================================
#5. From the data set in step 4, creates a second, independent tidy data set with the 
#   average of each variable for each activity and each subject.
#==========================================================================================

library(dplyr)
secondTidyData <- total_merge %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(secondTidyData, "tidy_data.txt", sep = ",", row.name = FALSE)
