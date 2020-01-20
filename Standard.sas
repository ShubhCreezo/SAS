/*This is a comment*/
* This also is a comment;
* This is the start of the DATA step
* We can give any name to DATA step, here it is bank
* We declare and read data in DATA step;
data bank;

* labels are optional;
*label dep="Deposit";

* By default the inputs are considered as numeric
* To specify character variable we have to give variable name followed by $ sign
* COMMAw.d allows to read comma embedded numeric values, here dep is being read as 14 char comma embedded numeric with zero decimal;
input did age sex$ dep comma14.0;

* cards and datalines are used to provide instream data;
cards;
100 24 M 20,000
200 45 F 10
;

* if we don't give any value after title clause then no title gets printed, this prevents SAS from printing default title;
title;
* Below code allows us to remove default printing of date, time and page numbers;
options nonumber nodate;

* This is PROC step, it prints data
* giving NOOBS option allows us to remove the observation number column that gets printed by default;
proc print noobs;

/* We can debug using PUTLOG, suppose there is a symantic error which doesn't shows in the saslog, now we can use PUTLOG to print the values
of the variables and thus can find if the values are getting correctly passed, this helps in finding symantic errors; 
This PUTLOG can be removed and the step can be resubmitted after we have corrected the error*/
data sample;
set sashelp.class;
avg= mean(height+weight);
PUTLOG height= weight= avg=;
if avg<30;
run;
