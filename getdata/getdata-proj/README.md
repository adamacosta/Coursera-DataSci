getdata-proj
============
The included script, run_analysis.R, downloads data from the Human Activity
Recognition project and cleans it to a tidy form stored in a tab-delimited
plaintext file. CODEBOOK.md explains each of the new variables, each of which
forms a column header in the resulting table. 

The original data consists of two sets: a training set and a test set. These
are contained in the two files X_train.txt and X_test.txt. These files
consist of raw data values. The files Y_train.txt and Y_test.txt map these
values to activities that the subjects were performing when the measurements
were taken, and the files subject_train.txt and subject_test.txt map the same
values to subject IDs.

Thus, to create one dataset from these files, we simply bind each of the 
training set files by column, bind each of the test set files by column, and
then merge the resulting tables into one master table containing both the
training and test data. This table contains very detailed summary statistics
of each type of measurement. We are not interesting in all of these summary
statistics, so we subset the table to only contain the mean and standard
deviation of each type of measurement.

The table then contains the mean and standard deviation of each type of
measurement at every measurement interval. Rather than include this many
observations, we take the average of all observations for each activity,
and display those as our observations instead. This results in 180 total
observations, or 30 subjects multiplied by 6 activities. Thus, the final
table, "clean.txt," contains these 180 observations of the mean and standard
deviation of each type of measurement, explained in the code book.
