<h1>Files</h1>
<ul>
<li>features.txt: List of all features.</li>
<li>activity_labels.txt: Links the class labels with their activity name.</li>
<li>train/X_train.txt: Training set.</li>
<li>train/y_train.txt: Training labels.</li>
<li>test/X_test.txt: Test set.</li>
<li>test/y_test.txt: Test labels.</li>
<li>train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </li>
<li>test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </li>
</ul>
<h1>Variables</h1>
<ul>
<li>x_test: Stores the test dataset features</li>
<li>y_test: Stores the test dataset activities codes</li>
<li>subject_test: Stores the test dataset subject codes</li>
<li>x_train: Stores the train dataset features</li>
<li>y_train: Stores the train dataset activities codes</li>
<li>subject_train: Stores the train dataset subject codes</li>
<li>df: Stores de merged data</li>
<li>feat: Stores a table with the features number and name</li>
<li>col: Stores the names of the features</li>
<li>activity_names: Stores the activities names</li>
<li>names: Stores the names of all the features as well as the activity and subject</li>
<li>right_cols: Stores the desired columns</li>
<li>tidy: Stores a tidy dataset after all the transformations are performed</li>
</ul>

<h1>Transformations</h1>

<h4>Merging the data:</h4>
<blockquote>df <- cbind(x_test,y_test, subject_test)</br>
df <- rbind(df, cbind(x_train, y_train, subject_train))</blockquote>

<h4>Extracting only the features related to mean and standart deviation:</h4>
<blockquote>right_cols<- grepl("\*mean", col) | grepl("\*std", col)</br>
df <- subset(df,select = right_cols)
</blockquote>

<h4>Changing the activity names to a more descriptive format:</h4>
<blockquote>df <- mutate(df, activity_name = activity_names[df[[80]]])</blockquote>

<h4>Getting the average of each variable by activity and subject:</h4>
<blockquote>df %>% group_by(activity_name, subject) %>% summarise_all(mean)</blockquote>
