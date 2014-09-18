#Readme#

The data sets were joined with X_test that was appended at the end of Xtrain to form data.

The column names were obtained via ./UCI HAR Dataset/features.txt
All the mean ad standard deviation values specified by "mean()" adn "std()" were selected to form the subset.

The original name standard was used.
For more information about them read ./UCI HAR Dataset/features_info.txt

y_test was appended to y_train to form ydata and converted to factor. The levels of ydata became those specified in ./UCI HAR Dataset/activity_labels.txt

subject_test was appended to subject_train to form sdata.

ydata and sdata were appended to data as two new column named Activity and Subject



