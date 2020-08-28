# 1.0 Load Library

library(dplyr)
library(tidyr)

# 2.0 Load the data and changing the column names as well for both train and test

# 2.1 train

features = read.table(paste0(getwd(),"/features.txt"), header = FALSE,stringsAsFactors = F) %>% rename("features_code" = "V1","measurement" = "V2")
activitylabels = read.table(paste0(getwd(),"/activity_labels.txt"), header = FALSE,stringsAsFactors = F) %>% rename("activity_code" = "V1","activity" = "V2")

train = read.table(paste0(getwd(),"/train/X_train.txt"), header = FALSE,stringsAsFactors = F)
colnames(train) = features$measurement 

train_labels = read.table(paste0(getwd(),"/train/y_train.txt"), header = FALSE,stringsAsFactors = F) %>% rename("activity_code" = "V1")
train_subject = read.table(paste0(getwd(),"/train/subject_train.txt"), header = FALSE,stringsAsFactors = F) %>% rename("subjects" = "V1")

# 2.2 test

test = read.table(paste0(getwd(),"/test/X_test.txt"), header = FALSE,stringsAsFactors = F)
colnames(test) = features$measurement 

test_labels = read.table(paste0(getwd(),"/test/y_test.txt"), header = FALSE,stringsAsFactors = F) %>% rename("activity_code" = "V1")
test_subject = read.table(paste0(getwd(),"/test/subject_test.txt"), header = FALSE,stringsAsFactors = F) %>% rename("subjects" = "V1")


# 3.0 merge test data and train data but first need to get only mean and std and subset it to the train data

# 3.1 for train

train_col= grep("mean()|std()",colnames(train), value = TRUE)

train = train[,train_col]

train = cbind(train,train_labels,train_subject)

train = left_join(train,activitylabels)

# 3.2 for test

test_col= grep("mean()|std()",colnames(train), value = TRUE)

test = test[,test_col]

test = cbind(test,test_labels,test_subject)

test = left_join(test,activitylabels)

# 3.3 merge all data

data = rbind(train,test)

# remove activity_code since we replace with descriptive activity
data = data[,-80]

# independent tidy data for average of each variable on activity and subjects

data_summarise = data %>% group_by(activity,subjects) %>% summarise_all(mean)


write.table(data_summarise,"data_summarise",row.names = FALSE)
