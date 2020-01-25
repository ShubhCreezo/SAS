/* DATASET management */

DATA data1;
input user$ age;
cards;
Karma 24
Aish 15
Eric 46
;

DATA data2;
input user$ age stats;
cards;
Sara 25 15.5
Pragya 23 23.2
;

/* We can join two datasets using SET */
/* concantenating SET statements produce final dataset containing all the obervations from all the SET datasets */
DATA data3;
set data1 data2;

/* If SET is used sequentially then it works as a MERGE BY statement */
DATA sample;
SET data1;
SET data2;
run;

/* MERGE BY statement */
/* This allows us to merge datasets based on a sorted key */
/* We will need to sort the datasets by key before using MERGE, SET can be used instead if we wish to merge unsorted datasets */
DATA sample2;
MERGE data1 data2;
BY user;
run;

/* We can rename variables in a dataset, since sometimes two different variables may be having same name in two datasets.
ex, Birth date and transaction date may be having name 'date' in two different datasets; now if we want to merge these two 
datasets, then dates will get overwritten by one or the other*/
DATA sample3;
MERGE data1(rename=(date=birth_date)) data2(rename=(date=txn_date));
BY user;
RUN;

/* we can also use PROC APPEND for joining two datasets 
   If any variable is missing in base datasets then PROC APPEND will throw an error,
   It works fine if the appended dataset is missing any variable */

PROC APPEND base=data2 data=data1;
run;

/* If we don't care about the extra variables while appending using PROC APPEND then we 
   can use FORCE option */
PROC APPEND base=data1 data=data2 force;
run;
  
/* If we want to appedn a subset of second dataset then we can specify the condition */
PROC APPEND base=data1 data=data2 (where=(age>24)) force;
run;

PROC PRINT data=data1;
run;

/* We can create a dataset with two datasets, update a dataset with new values from another 
   dataset for this we need both datasets sorted with teh reference variable */
* updatemode allows us to move missing values into old dataset;
DATA data4;
input user$ age stats;
datalines;
Creezo 24 .
Diablo 15 99
Muriel 46 39
Shubh 26 47
;

PROC SORT data=data1;
by age;

PROC SORT data=data4;
by age;

DATA data5;
update data1 data4 updatemode=nomissingcheck;
by age;

/* We can create a new variable in new dataset by performing operations on old dataset */
DATA data6;
set sashelp.class;
new_height= height + 10;

PROC PRINT data=data6;

/* Another way is to use MODIFY 
   MODIFY will only work with old datasets and old variables*/
DATA data1;
modify data1;
age = age +1;

PROC PRINT data=data1;

