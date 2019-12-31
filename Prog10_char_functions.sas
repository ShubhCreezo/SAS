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

PROC PRINT data=data5;
run;