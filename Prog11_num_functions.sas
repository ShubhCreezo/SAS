/* SAS numeric functions */
/* Here are some functions used for calculations */
/* LAG takes previous values of the given variable */
DATA num;
input marks;
datalines;
99.23
99.99
-9.23
10.01
;

DATA num1;
set num;
m1= int(marks);
m2= abs(marks);
m3= log(marks);
m4= ceil(marks);
m5= floor(marks);
m6= round(marks);
m7= round(marks,.1);
m8= log2(marks);
m9= lag(marks);
marks0= mod(marks,2);
run;

/* SUM function process data horizontally; if we want vertical sum then use SUM statement*/
DATA num2;
input q1-q4;
datalines;
10.25 7 5 23.2
25 . 2 9.23
7 26 1 .
;

DATA num3;
set num2;
total= sum(of q1-q4);
avg= mean(of q1-q4);
high= max(of q1-q4);
low= min(of q1-q4);
total_first_and_last= sum(q1,q4);

PROC PRINT data=num3;
sum q1-q4;
run;

/* To convert horizonal data into a variable */
DATA num4;
input marks @@;
datalines;
1 2 3 4 5
;

PROC PRINT data=num4;
