library("dplyr")

# Reads "Test Data"
test_volunteer <- read.table(file = "subject_test.txt")
test_X <- read.table(file = "X_test.txt")
test_Y <- read.table(file = "y_test.txt")

# Renames activity code into descriptive values in test_Y
test_Y[test_Y == 1] <- "walking"
test_Y[test_Y == 2] <- "walking_upstairs"
test_Y[test_Y == 3] <- "walking_downstairs"
test_Y[test_Y == 4] <- "sitting"
test_Y[test_Y == 5] <- "standing"
test_Y[test_Y == 6] <- "lying"

# Merges Test Data into one table
test_merged <- cbind(test_volunteer, test_Y, test_X)

# Reads "Train Data"
train_volunteer <- read.table(file = "subject_train.txt")
train_X <- read.table(file = "X_train.txt")
train_Y <- read.table(file = "y_train.txt")

# Renames activity code into descriptive values in test_Y
train_Y[train_Y == 1] <- "walking"
train_Y[train_Y == 2] <- "walking_upstairs"
train_Y[train_Y == 3] <- "walking_downstairs"
train_Y[train_Y == 4] <- "sitting"
train_Y[train_Y == 5] <- "standing"
train_Y[train_Y == 6] <- "lying"

# Merges Train Data into one table
train_merged <- cbind(train_volunteer, train_Y, train_X)

# Merges Test and Train Data
test_train <- rbind(train_merged, test_merged)
str(test_train)

# Reads "Features" table, combines column names and adds "volunteer" and "activity"  
features <- read.table(file = "features.txt")
featuresV2 <- paste(features$V2, features$V1, sep = "")
clean_features <- gsub("-","", featuresV2)
clean_features <- gsub("()","", clean_features, fixed = T)
clean_features <- gsub("(","", clean_features, fixed = T)
clean_features <- gsub(")","", clean_features, fixed = T)
clean_features <- gsub(",","", clean_features, fixed = T)
clean_features

volunteer_activity <- c("volunteer", "activity")
col_names <- c(volunteer_activity, clean_features)

# Renames columns (variables) of test_train table
names(test_train) <- col_names

# Extracts only the measurements on the mean and standard deviation for each measurement
mean_stdv <- subset(test_train, select = grep(".*mean.*|.*std.*", x = names(test_train)))
str(mean_stdv)

# Independent tidy data set with the average of each variable for each activity and each subject
# Groups the data set by volunteers and activity and calculated the mean for each volunteer and activity
grouped_dataset <- group_by(test_train, volunteer, activity)
tidy_data <- summarize_each(grouped_dataset, funs(mean))

# Created a text file named "tidydata.txt" and exports it in the current directory
write.table(tidy_data, file = "tidydata.txt", row.name = F)


