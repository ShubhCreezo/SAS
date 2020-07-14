/*Here we are gonna learn dataset options */

/*dataset options are given in parentheses after dataset name */
/* To check if dataset name already exists */
DATA data (replace=no);
input user$ number;
datalines;
Karma 98
Aish 45
;

/* Password option */
DATA data1 (password= buenos read=house);
input user$ number;
datalines;
Karma 98
Aish 45
;

/* Labels- We can give variable definitions using LABEL */
DATA data2 (label="Internet user data");
label user="Service user"
 	  number= "Id number"
 	  ;
input user$ number;
datalines;
Karma 98
Aish 45
;

* We can print the labels;
PROC PRINT data=data2 label;

/* SET statement */ 
DATA data3;
/* We can copy contents of any dataset in the given dataset using SET statement
 also we can drop the variables we don't require */
set sashelp.class(drop=height weight);
run;

DATA data4;
/* We can copy contents of any dataset in the given dataset using SET statement
 also we can keep only the variables we require */
set sashelp.class(keep=name age);
run;

/* We can also copy the data from another dataset as well as rename the variables */
DATA data5;
set sashelp.class(rename=(name=user_name age=user_age));
run;

/* We can filter the data using WHERE clause */
DATA data6;
set sashelp.class(where=(age=14 and sex="M"));
run;


/* If we want observations starting from a given count we can achive it using FIRSTOBS AND OBS*/
/* This allows us to get a range of observations; imagine them as from and to */
DATA data7;
set sashelp.class(firstobs=4 obs=6);
run;

DATA data8;
set sashelp.class;
if _n_ = 3 then output;
if _n_ = 13 then output;
run;

/* Combining two datasets */
DATA data9;
input user$ sex$;
datalines;
Karma M
Aish F
;

DATA data10;
input user$ gender$;
datalines;
Karma Male
Aish Female
;

DATA data11;
/* If we use multiple datasets in a single set statement then the number of observations in the new data set is the total number of observations from all the 
datasets. All the variables are also present in the output dataset.*/
* set data9 data10;
/* If we use multiple set statements then where same-named variables occur, values that are read from the second data set replace those that are read from the first 
data set. Also, the number of observations in the new data set is the number of observations in the smallest original data set. */
set data9;
set data10;
run;

PROC PRINT data=data11;
