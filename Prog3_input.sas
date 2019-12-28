/* This module helps to understand various methods to read input */

OPTIONS NONUMBER NODATE;
TITLE "Practice Module!!!";

/* for list input method to work the input must be separated by at least one blank */
DATA list_input;
/* by default char length is limited to 8, we can aler it using LENGTH */
LENGTH SEX$ 20.;
INPUT ID AGE SEX;
/* We have to give period(.) for missing values when using list input */
CARDS;
1223334444 24 GOOD_FEMALE
200 . M
;
RUN;

/* COLUMN input */
* Here order is not important for specifying input;
DATA column_input;
input user$ 1-10 comment$ 10-30 rating 31;
cards;
Karma     Food is good        5
Aish      Excellent   
;

/* Formatted input */
/* we end declaration with period */
DATA form_input;
input @1 user$ 10. @11 comment$ 20. @31 rating 1.;
cards;
Karma     Food is good        5
Aish      Excellent   
;     

/* we can also use relative referencing with formatted input */
DATA form_input2;
input user$ 10. +2 comment$ 20. +2 rating 1.;
cards;
Karma       Food is good          5
Aish      Excellent   
;     

/* Named input method */
DATA named_input;
input name=$ score=;
datalines;
name=Shubham score=22
name=Aish score=25
;

/* we can also create records without using input */
DATA direct_input;
a = 5;
b= 6;
c = "This is good";
output;

/* Question: data is separated by two spaces; read it */
DATA practice;
input comment$ & 40. Place$;
datalines;
This place has good food  Mumbai
Good for nothing  Delhi
;
* Amperstand symbol(&) separates data from first double space encountered
  Colon symbol(:) separates data from first single space it encounters;
   
PROC PRINT DATA=practice noobs;
RUN;