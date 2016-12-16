# GettingAndCleaningDataProject
# 
## Steps:
First the Script loads all necessary packages. Next it extracts and combines the test data, training data, features, and activities and combines them into a single dataset. It uses grep to identify and store only the features with mean or std in their names. It then replaces numeric values with lookup value from activity. It then grabs the variable names to update the column names of the new dataset. Next it uses lapply to sort features average by Subject and by activity.  Finally it uses write.table to write the tidy dataset to a txt file
