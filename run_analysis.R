# STEP 1: Read through the datasets and extract necessary columns
features <- read.table("features.txt", header = FALSE)
features <- features[["V2"]] # extract signal variable names to name columns

## TEST data
#--1 Reading the datasets
test_values <- read.table("X_test.txt", header = FALSE)
test_labels <- read.delim("y_test.txt", header = FALSE)
test_subjects <- read.delim("subject_test.txt", header = FALSE)

#--2 Extracting the mean and sd
colnames(test_values) <- features # replace column names according to their respective features
test_mean <- test_values[, grepl("mean()", names(test_values))]
test_mean <- test_mean[, !grepl("meanFreq", names(test_mean))] # remove meanFreq variables
test_sd <- test_values[, grepl("std()", names(test_values))]

#--3 Creating the clean dataset
test_data <- data.frame(test_subjects, test_labels, 
                        test_mean, test_sd)

## TRAIN data
#--1 Reading the datasets
train_values <- read.table("X_train.txt", header = FALSE)
train_labels <- read.delim("y_train.txt", header = FALSE)
train_subjects <- read.delim("subject_train.txt", header = FALSE)

#--2 Extracting the mean and sd
colnames(train_values) <- features # replace column names according to their respective features
train_mean <- train_values[, grepl("mean()", names(train_values))]
train_mean <- train_mean[, !grepl("meanFreq", names(train_mean))] # remove meanFreq variables
train_sd <- train_values[, grepl("std()", names(train_values))]

#--3 Creating the clean dataset
train_data <- data.frame(train_subjects, train_labels, 
                         train_mean, train_sd)


# STEP 2: Merge the clean datasets together
merged_data <- rbind(test_data, train_data) # merged vertically

# STEP 3: rename activities to become descriptive
merged_data$V1.1 <- as.character(merged_data$V1.1) # change the class so the values can be subbed
merged_data$V1.1 <- sub("1", "walking", merged_data$V1.1)
merged_data$V1.1 <- sub("2", "walking upstairs", merged_data$V1.1)
merged_data$V1.1 <- sub("3", "walking downstairs", merged_data$V1.1)
merged_data$V1.1 <- sub("4", "sitting", merged_data$V1.1)
merged_data$V1.1 <- sub("5", "standing", merged_data$V1.1)
merged_data$V1.1 <- sub("6", "laying", merged_data$V1.1)

# STEP 4: label the dataset (columns) appropriately
clean_data <- merged_data

names(clean_data) <- sub("V1.1", "activity", names(clean_data))
names(clean_data) <- sub("V1", "subject", names(clean_data))
names(clean_data) <- gsub("(\\.+)", "", names(clean_data))
names(clean_data) <- gsub("mean", "Mean", names(clean_data))
names(clean_data) <- gsub("std", "Std", names(clean_data))
names(clean_data) <- gsub("BodyBody", "Body", names(clean_data))

# STEP 5: make another dataset with average of each variable based on activity and subject
library(dplyr)
data_summary <- clean_data %>% 
      group_by(across(c("subject", "activity"))) %>% 
      summarise_all(mean)

## Save the final data frame as txt file
write.table(data_summary, 
            file ="D:/Courses/RStudio/UCI HAR Dataset/Getting-and-Cleaning-Data-Assignment/table.txt",
            row.names = FALSE)