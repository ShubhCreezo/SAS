/* Here we will understand about PROC FORMAT */

/* numeric to character */

DATA form;
input id gender marital_status;
cards;
100 1 2
200 2 1
300 1 .
400 1 1
;
PROC FORMAT ;
value converted_gen
1= "Male"
2= "Female"
;
value converted_MS
1= "Married"
2= "Unmarried"
;

PROC PRINT data=form;
format gender converted_gen. marital_status converted_MS.;
RUN;

/* Character to character */
DATA form2;
input user$ type$ count$ gender age;
cards;
Karma A 65.2 1 24
Pragya B null 2 56
Aish O 45.6 1 30
Devil Z 95.2 2 15
;
* The dollar symbol($) to declare the value as char should be before the name else it will 
throw an error;
PROC FORMAT;
value $blood_type
"A"= "A type"
"B"= "B type"
"AB"= "AB type"
"O"= "O type"
"Z"= "Z type"
;
* null is printed as blank by default;
value $strength
'null'= '0'
;

* we can change the length of formatted value in print step. here we have done for strength;
PROC PRINT data=form2;
format type $blood_type. count $strength4. gender gender_num. ;
run;

/* numeric to numeric is easy; go figure */

/* NUMERIC TO CHAR */
PROC FORMAT;
value gender_num
1="Male"
2="Female"
;

/* We can use format to change any particular value */
PROC FORMAT; value $CHANGE 65.2= 93.7;

PROC PRINT data=form2;
format count $change. gender gender_num. ;
run;

PROC FORMAT;
value $gender_new
"M"=1
"F"=2;

/* We can print saved format in library */
/* fmtlib allows us to do that */
/* CNTLOUT is the name of the dataset to be created */
PROC FORMAT library=work fmtlib cntlout=out_format;
/* we can select any particular formats we want to save */
/* select is optional here. default is all formats */
select $gender_new;

/* We can use previously saved formats */
/* cntlin is used to specify proc format dataset */
PROC FORMAT library=work cntlin=out_format;
/* we can include specific formats using select */

/* fmterr allows us to ignore format errors and get output*/
/* fmtsearch is used to specify the library for taking format definitions */
options fmterr fmtsearch=(sasuser);

/* We can specify range in FORMAT*/
PROC FORMAT;
value age_new
10-20= "Young"
35-45= "Middle"
60-70= "Old"
;

PROC PRINT data=sashelp.class;
format sex $gender_new. age age_new.;
run;

