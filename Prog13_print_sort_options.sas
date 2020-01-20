/* PRINT options */

* We can print change column heading using LABEL;
DATA print;
set sashelp.class;

PROC PRINT data=print label;
label age="Patient age"
	  name="Patient name";
run;

/* We can use KEEP in data step to select variables we want to print;
   also we have option to use VAR in PRINT step to select variables to print and define their
   order*/
DATA print1;
set print;
keep name age;
run;

PROC PRINT data=print1;
run;

PROC PRINT data=print;
var name age;
run;

* If we want to print a label with custom breaks then we can use SPLIT;
PROC PRINT data=print split="#";
label name="Patient#name"
	  age="Patient#age"
;
run;

* We can get sum of numeric variables use SUM statement;
PROC PRINT data=print;
sum age height weight;
run;

/*
NOOBS- removes the default obs column
DOUBLE- addes extra spacing between observations
WIDTH- width="full" allows to use A4 size to print observations; default is width=minimum
HEADING- heading="vertical" allows us to print heading in a vertical pattern; saving space
*/
PROC PRINT data=print noobs width=uniform double heading=vertical;
run;

/* SORT options */
/* We can sort data by variables
   OUT allows us to create a new sorted dataset, thus maintaining the state of original */
PROC SORT data=print out=print_sort;
by height weight;
run;

PROC PRINT data=print_sort;

/* We have to give descending option for each variable to sort it in descending order */
PROC SORT data=print out=print_sort1;
by descending height descending weight;
run;

PROC PRINT data=print_sort1;

* SORT step sorts the capital first and then small letters, take a look at the example;
DATA print_sort3;
input user$;
datalines;
Karma
Aish
karma
annie
;
/* if we don't specify out then original dataset will get changed*/
PROC SORT data=print_sort3;
by user;

* If we don't want to go with default for capital and small letter;
PROC SORT data=print_sort3 sortseq=linguistic;
by user;

PROC PRINT data=print_sort3;

/* Sorting priority */
DATA print_sort4;
input randoms$;
datalines;
.
$
-2
0
45
A
a
;

PROC SORT data=print_sort4;
by randoms;

PROC PRINT data=print_sort4;

/* We can remove duplicate records using NODUPKEY to remove by duplicate keys and 
   NODUPRECS to remove by duplicate records */
PROC SORT data=print out=print_sort5 nodupkey;
by age;

PROC PRINT data=print_sort5;

/* We can group variables by including BY and ID statements in PRINT step */
/* The dataset needs to be sorted first, ID allows us to put the sorted variable as the 
first variable and makes the grouping cleaner */
/* If ID and VAR statements both contain same variable then it is printed twice; since ID allows us to replace obs and instead list 
observations by ID variable values and VAR allows us to choose the variables and decide their order */
/* BY NOTSORTED <variable name>; this allows us to group contiguous variable values without sorting; if 5 values are repeating
then they form one group and this repeats to form groups*/
PROC SORT data=print;
by age;

PROC PRINT data=print;
id age;
by age;
run;

/* We can get grouped data on different pages by using PAGEBY statement ; must always be used
with BY statement */
PROC PRINT data=print;
by age;
pageby age;
run;

/*We can print definite number of observations using FIRSTOBS AND OBS system options*/
/* Below statement reads observations 5 through 10 */
option firstobs=5 obs=10;
proc print data=sashelp.class;
run;
/* We can reset obs in the same program by again using option statement */
option firstobs=1 obs=max;
/* Other way to approach selection of a range of data is by using a dataset option; this we do by using parentheses after
we include a dataset*/
data sample1;
set sample(firstobs=10 obs=15);
run;

proc print data=sample1;
run;

/* We can cancel a title by specifying a title statement with lower value or only title statement with no value to cancel all
titles; same applies for footnote*/
* For example below title statement allows title1 to print although any higher value title is cancelled;
title2;

