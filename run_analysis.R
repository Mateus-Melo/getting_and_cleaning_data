

library("tidyr")
library("dplyr")

#Reading all the data

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Putting the data together in a single dataframe called df

df <- cbind(x_test,y_test, subject_test)
df <- rbind(df, cbind(x_train, y_train, subject_train))

#Reading the features.txt file and getting only the column
#with the feature description

feat <- read.table("features.txt")
col <- feat[[2]]

#Getting the activity names

activity_names <- read.table("activity_labels.txt")[[2]]

#Using descriptive names to the variables

names <- c(col, "activity_name", "subject")
names(df) <- names

#Getting a boolean array to index the only the collumns of
#the measures on the mean and standart deviation

right_cols<- grepl("*mean", col) | grepl("*std", col)

#Selecting the desired collumns of the dataframe

df <- subset(df,select = right_cols)


#Using descriptive names to the activities in the dataframe

df <- mutate(df, activity_name = activity_names[df[[80]]])

#Getting the average of each variable by activity and subject

tidy <- df %>% group_by(activity_name, subject) %>% summarise_all(mean)

write.table(tidy, file = "tidy_dataset.txt", row.name=FALSE)