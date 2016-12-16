# GettingAndCleaningDataProject
# 
# Steps:
# First the Script loads all necessary packages
# Next it extracts and combines the test data, training data, features, and activities and combines them into a single dataset
# It uses grep to identify and store only the features with mean or std in their names
# It replaces numeric values with lookup value from activity
# It then grabs the variable names to update the column names of the new dataset
# Next use lapply to sort features average by Subject and by activity
# Finally it uses write.table to write the tidy dataset to a txt file
# 
# Code book:
# activity: table of activity level from raw data
# CleanedData: cbind of Subject, Y, X
# features: table of features from raw data
# Subject: rbind of SubjectTest and SubjectTrain
# SubjectTest: testing info from raw data
# SubjectTrain: training info from raw data
# TidyData: final dataset that is written to the txt file, Cleaned data sorted averages by subject and activity
# X: the features of x_test and x_train including mean or std
# Y: the features of y_test and y_train including mean or std
#
#
