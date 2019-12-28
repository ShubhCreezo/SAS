/* In this module we are gonna learn Date formats */
DATA date;
input user$ date;
* INFORMAT allows us to read date in the form of number of days from 01/01/1960;
informat date ddmmyy10.;
datalines;
Karma 24/02/2004
Gump  16-05-1960
Dan   05.12.1950
Jenny 01/01/1960
;

DATA date1;
* Another way to declare dates is by using colon symbol(:);
input user$ date: ddmmyy10.;
/*
	20/12/2020	ddmmyy10.
	20.12.2020	ddmmyyp10.
	20122020	ddmmyyb10.
	20-12-2020	ddmmyyd10.
	20:12:2020	ddmmyyc10.
*/

datalines;
Karma 24/02/2004
Gump  16-05-1960
Dan   05.12.1950
Jenny 01/01/1960
;
run;

/* yearcutoff option is used to set the starting year. This is helpful in cases in which we 
have two digits of year like 20/12/90, here if we don't specify yearcutoff then year will be 
read as 1990 but if we are working with 18th century data then yearcutoff can be set to 1800
*/
options yearcutoff=2000;

DATA date2;
input user$ adate ddate;
/*
20-Dec-2020 DATE11.
20Dec2020 	DATE9.
20Dec20   	DATE7.
*/
informat adate date9. ddate date11.; 
datalines;
Karma 03Nov2019 20-Dec-2020
Aish  15Oct2018 18-Nov-2019
;

DATA date3;
input user$ adate ddate;
* Julian date can be read and printed by SAS;
informat adate monyy5. ddate julian.;
datalines;
Karma Dec20 2019010
Bear  Jan19 2018150
;

/* we can use weekdate to get week and date; if we increase the size of format then we can 
get complete date in the format day, date/ month/ year; for complete date use length 34.*/
PROC PRINT data=date;
* FORMAT allows us to print number of days to date in the desired format.
 the syntax(nearly all of them) used to read date in INFORMAT can also be used with FORMAT;
format date weekdate5.;
run;
