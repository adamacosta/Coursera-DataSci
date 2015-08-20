### Subjects

The experiment was conducted on 30 subjects who wore smartphones that measured
their acceleration in each of three spatial dimensions at specified time 
intervals. These subjects are numbered 1 - 30, and these form the first set of
labels for each row. The variable, or column header, containing the subject IDs,
is simply labelled "ID."

### Activities

Each subject was monitored while performing each of six different activities.
The variable name, serving as the column header of the second column, is "act,"
and the possible values are "STANDING," "SITTING," "LAYING," "WALKING,"
"WALK_UP," and "WALK_DN." The first four are self-explanatory. The last two
activities designate the act of walking upstairs and walking downstairs,
respectively. 

### Measurements

The remainining variables consist of the mean and standard deviation of each
type of measurement. Each is labelled something like "t_MeanX," or "f_StdY,"
where "_" denotes the measurement and "t" or "f" denotes that the measurement
is either in the time domain or frequency domain. Time domains measurements
are raw measurements, where frequency domain quantities are found by applying
a Fast Fourier Transform to the time domain measurements.

If the label contains "Mean," then it is the mean for that type of measurement. If it contains "Std," then it is the standard deviation for that type of 
measurement. The last letter denotes the dimension of movement in which the 
measurement was taken. The measurements themselves are:

* BodyAcc

This denotes the total acceleration of the subject in the designated dimension
while performing the designated activity, as measured by the acclerometer on
their phone. 

* BodyAccMag

This consists of only the magnitude of BodyAcc. All magnitudes are calculated
using the Euclidean norm.

* GravityAcc

This denotes the acceleration of gravity in the designated dimension.

* GravityAccMag

The magnitude of GravityAcc.

* BodyAccJerk

The signals in each of the three dimensions are used to calculate angular
velocity, which forms the BodyAccJerk quantity.

* BodyAccJerkMag

The magnitude of BodyAccJerk.

Each of the remaining variables, "BodyGyro," "BodyGyroMag," "BodyGyroJerk,"
etc., measure the same quantity as the variables already described, but using
the gyroscope from the phone instead of the accelerometer. 
