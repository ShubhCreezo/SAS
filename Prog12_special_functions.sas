/* To convert char to numeric */
DATA sample;
input marks$;
datalines;
24
5.23
2.3
6
;

DATA ctn;
set sample;
* INPUT() allows us to convert char to numeric;
* BEST. allows us to allocate appropriate numeric data type, this helps especially when dealing
with large data and we are unsure of the format;
marks1 = input(marks, best.);
/*If we are sure of the data format then its always better to specify it
new_marks = input(marks, 3.);
*/
PROC PRINT data=ctn;
sum marks1;
run;

/* To convert numeric to char */
DATA ctn2;
set ctn;
* PUT() allows to convert numeric to char;
* || symbol allows us to concatenate strings;
marks2= put(marks1, best.)||" out of 50";
run;

/* Date Time functions */
DATA date;
* This retruns todays date;
date= today();
* This returns current date and time;
dt= datetime();
* This returns current time;
time= time();
* DHMS allows to read comma separated values as date,hours,minutes,seconds;
dt2= dhms(date,14,15,38);
dt3= hms(15,14,38);
* We can directly read date if its in the below format;
dob= '03nov1996'd;
* third argument 'ACTUAL' allows us to find the difference between the dates considering the 
different days in months and leap years,  if we omit the third argument then by default 'AGE'
is taken as third argument which returns number of years;
age= int(yrdif(dob,date,'actual'));
*age= yrdif(dob,date);
format date dob date9. dt dt2 datetime. time dt3 time.;
run;

/* INTCK is a multi role difference calculating function */
DATA date1;
dt= '05Jan2019'd;
dt1= '15Feb1996'd;
year= intck('year',dt1,dt);
month= intck('month',dt1,dt);
days= intck('day',dt1,dt);

/* We have multiple functions like WEEKDAY(), MONTH(), SECOND(),etc to get desired info from
given date and time */
DATA data2;
dttime= datetime();

DATA data3;
set data2;
datepart_of_dttime= datepart(dttime);
timepart_of_dttime= timepart(dttime);
month_of_dttime= month(datepart_of_dttime);
hours= hour(timepart_of_dttime);
format datepart_of_dttime date9. timepart_of_dttime time8.;
PROC PRINT data=date3;
run;
