* libname is used to connect project library to current programe;
* Any dataset created in this program gets saved in specified library; 
libname myproj "C:\Users\Shubham\Desktop\HomeDirectory";

title "Hello World!!!";
options nonumber nodate;

data bank;
input did age sex$ dep comma14.0;
cards;
100 24 M 200,005,600
200 45 F 10
;

proc print data=bank noobs;

* This allows us to print the report of the dataset we created in the library;
* varnum allows us to print the variables in the order specified in the declaration in DATA step;
proc contents data=bank varnum;