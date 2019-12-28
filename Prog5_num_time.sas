/* This module will help us understand numeric data formats */

DATA numeric;
input user$ salary deposit;
/* using commaN.D we can specify format of numbers for comma and using dollarN.D for dollars*/
informat salary comma7. deposit dollar7.;
datalines;
Karma 400,000 $25,000
;

PROC PRINT data=numeric;
* Using wordsN. we can print numeric date into words.;
format salary comma7. deposit words34.;
run;

* Below are various time formats;
/*
Data value 				informat 	format
12dec2010:06:56:56am	datetime20.	dateampm20.
15Nov2009:14:06:35		datetime18.	datetime18.
15:08:45				time8.		time8.
06:35:18pm				time10.		timeampm10.
*/

DATA time;
input user$ time_in time_out;
informat time_in time10. time_out time8. ;
datalines;
Karma 12:05:02pm 16:06
;

PROC PRINT data=time;
format time_in time8. time_out timeampm10.;
run;

/* Below is SAS percent format */
DATA num2;
input student_name$ percentage;
informat percentage percent3.2;
datalines;
Karma 95.2%
;
PROC PRINT data=num2;
format percentage percent5.;
run;

