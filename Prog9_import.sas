/* Import files in SAS*/

/* file type	extension	DBMS
	excel		.xls/.xlsx  xls/xlsx
	access		.mdb/.accdb	access
	delimiter	.txt		dlm
	csv file	.csv/.txt	csv
	tab file	.txt		tab
*/

* We need to specify output dataset while importing in SAS;
/* we have to use REPLACE if we want to re run the import step */
/* GETNAMES allows us to read first row in excel as variable names */
/* DATAROW allows us to specify the first record to be read */
/* RANGE is probably the coolest one as it allows us to guess what, import a range from excel*/
PROC IMPORT datafile="/folders/myfolders/extfiles/CLASS.xlsx" dbms=xlsx 
			out=new_data(keep=name age) replace;
sheet="CLASS";
getnames=yes;
* datarow=5;
* range='sheet_name$ A1:E10' ;
run;

/* We can export dataset to excel
 we have to use REPLACE if we want to re run the export step
*/
PROC EXPORT outfile="/folders/myfolders/extfiles/sample.xlsx" data=sashelp.air dbms=xlsx;
RUN;

/* text file import */
PROC IMPORT datafile="/folders/myfolders/extfiles/sample_data_multiple_rows.txt" 
			dbms=csv out=new_data replace;
getnames=no;
run;			

/* We can use filename statement to specify a fileref to a file location; this allows for better coding */
filename Sample "/folders/myfolders/extfiles/sample_data_multiple_rows.txt"
PROC IMPORT datafile=Sample dbms=csv out=new_data replace;
run;

/* to import all the sheets from excel use libname ;
   we cannot import multiple sheets using proc import statement*/
/* All the sheet names are stored as datasets of the new library. */
libname sample XLSX "/folders/myfolders/extfiles/sample.xlsx";

/* We can export to any format by specifying dbms and outfile */


PROC PRINT data=new_data;
run;
			
