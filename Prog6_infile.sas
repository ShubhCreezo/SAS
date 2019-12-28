/* infile data*/
DATA master;
/* DSD = Data sensitive delimiter 
   DLM = delimiter */
infile cards dsd;
input user$ rank;
cards;
Karma,15
;

DATA master2;
infile cards dlm=",$""";
input user$ rank;
cards;
Karma,"15
Prag$20
;

/* we can use infile to specify location of external file to be used for input data */
DATA master3;
infile "/folders/myfolders/extfiles/sample_data_2_cols.txt" dlm=",$";
input user$ rank;

/* We can filter a given data using @ symbol */
DATA master4;
infile cards dlm=",$""";
input @'Karma' score;
cards;
Karma,"15
Prag$20
Karma,12
Ash,30
Prag15
;

/* we can specify firstobs and obs to provide a range of records read by sas */
DATA master5;
infile "/folders/myfolders/extfiles/sample_data_multiple_rows.txt" dlm="," firstobs=2 obs=7;
length user$ 20.;
input user$  rank;

PROC PRINT data=master5;
run;
