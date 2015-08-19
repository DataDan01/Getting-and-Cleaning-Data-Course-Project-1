---
title: "README"
output: html_document
---

#Getting and Cleaning Data Course Project by Daniel Alaiev

This is my course project for the Getting and Cleaning Data Course. 

Download the entire repository if you wish to run the scripts. 

CodeBook.md should explain the gist of what is going on with these files. Essentially, this is an attempt to tidy a data set and provide a summary. Please read CodeBook.md first.

The original data set and description could be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Please download and place the following files (link above) in the same directory as the script:
* features.txt
* subject_train.txt
* y_train.txt
* X_train.txt
* subject_test.txt
* y_test.txt
* X_test.txt

After you have read CodeBook.md run the run_analysis.R script. It has comments explaining each code chunk. The script will look for the files in the same directory it is in. The script should output a final table called finaltable. The final table is an independent tidy data set with the average of each feature variable for each Activity and each Subject. 
