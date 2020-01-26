/* The DO statement in SAS allows us to loop within DATA step */
/* This results in removing code redundancy */

DATA sample;
SET sashelp.class;
DO i=1 TO 5;
  height + 1 ;
END;
RUN;

/* We can nest DO loops within each other */
/* To get every iteration in output we can use OUTPUT statement within DO loop else only last iteration state gets passed in 
ODS from PDV */

/* WHILE and UNTIL */
/* UNTIL allows for at least one iteration even when condition is not met as UNTIL checks the condition at the end of loop 
on the contrary WHILE checks the condition at the start of loop */
DATA sample2;
SET sashelp.class;
DO i= 1 to 10 WHILE(height<=500);
  height+2;
END;
RUN;
