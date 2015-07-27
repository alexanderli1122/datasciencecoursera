##Readme for run_analysis.R script for "Getting and Cleaning Data" project
###These are an overview on how the script is run, and no extra steps need to be taken because all instructions are in script.
###Only step required is to select the script and run it
###"testtraindata" contains the complete merged data
###"IDActivitMean" contains the dataframe with the means by ID and Activity

###1. The first step is to load the necessary packages for my script.
The packages I used are "dplyr" and "reshape2."

###2. Next the script downloads and unzips the zip file.
It is renamed to "project data," and the first step is to navigate in to the folder

###3. The first variables are just place holders to extract the data
"testdata" stores the tables in "test" folder. "traindata" stores the tables in "train" folder.

###4. The data is stored into dataframes
"testdata" becomes "testdataframe." "traindata" becomes "traindataframe."

###5. The two separate dataframes are merged into one
The "full_join" function is used to merge the two dataframes

###6. The names of columns are extracted from file that contains names of the columns
Also, added "ID" and "Activity" for the first two columns.

###7. The activities are labeled
This was done by changing the column into a factor. Values stored are as according to "activity_labels.txt"

###8. Means of dataset by ID and Activity are created
Used "melt" and "dcast" to create dataframe
