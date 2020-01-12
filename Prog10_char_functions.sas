/* Functions in SAS */
/* Char functions */

* We can use UPCASE, LOWCASE and PROPCASE functions in SAS ;
DATA data;
set sashelp.class;
name = upcase(name);
run;

/* COMPBL- compress blanks, allows us to replace multiple blanks with single blank from string */
/* COMPRESS removes any unwanted chars from a string */
DATA data1;
a1= "Hi  I  am really     cool!!!";
a2=compbl(a1);
a3=compress(a1,"! ");
a4=upcase(compbl(a1));
run;

/* FIND allows us to search for a string in another string */
/* if we give "i" as the third argument in FIND then we can turn off case sensitivity */
/* if we give a number as the third argument then we can start search from that position 
of given string*/
DATA data2;
a1= "We are awesome";
a2= find(a1,"we");
a3= find(a1,"we","i");
a4= find(a1,"we",2);

/* To find all the observations containing a specific string */
DATA data3;
input user$ 10. address$ 20.;
datalines;
Karma     Powai, Mumbai
Aish      Fort, Mumbai
Cuddy     Tower, Shimla
;

DATA data4;
set data3;
lives_or_not = find(address,"Mumbai");
if lives_or_not gt 0;
run;

/* We can use INDEX which is same as FIND */
/* INDEXW allows us to search words in a string */
DATA data5;
a1= "I am getting late.";
a2= indexw(a1,"get");
run;

/* VERIFY function*/
* VERIFY allows us to check if given chars are present is a given string;
DATA data6;
str1= "Hellotyr";
var= verify(str1, "Helo");
run;

/* SUBSTR allows us to extract a piece of a string */
DATA data7;
str="Karma Mumbai";
var= substr(str,7);
var2= substr(str,7,3);

/* To extract a substring from last positon */
DATA data8;
input user$20.;
datalines;
KarmaMUM
EricDEL
;

DATA data9;
set data8;
var= substr(user,length(user)-2);

/* To concatenate strings */
/* CATS removes blanks */
/* CATX allows to add chars while concatenating */
/* CATT removes leading blanks only */
DATA data10;
set sashelp.class;
new= cat(name, age);
new2= cats(name, age);
new3= catt(name, age);
new4= catx(':', name, age);
run;

/* We can change the alignment of data */
/* Can only be used with chars- RIGHT LEFT */
DATA data11;
set sashelp.class;
name1= right(name);
run;

/* more ways to remove spaces */
/* TRIM removes trailing spaces */
/* STRIP removes leadina and trailing spaces */
/* SAS automatically removes trailing spaces */
/* LENGTHM gives the length occupied in memory; especially good when counting trailing spaces*/
DATA data12;
input string: $20.;
lenstr= lengthm(string);
strip= strip(string);
lenstrip= lengthm(strip);
trim= trim(string);
lentrim= lengthm(trim);
datalines;
   Karma   
run;

/* SCAN allows us to retreive words based on position; this is different from SUBSTR */
DATA data13;
str= "Hello! How are you?";
str2= scan(str,3);
str3= scan(str,-3);

/* TRANWRD is the replace in SAS*/
DATA data14;
str= "hello! How are you?";
str1= tranwrd(str, "hello", "Hi");
run;

PROC PRINT data=data14;
run;
