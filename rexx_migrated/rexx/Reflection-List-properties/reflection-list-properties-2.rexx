/*ª* REXX shows the "equivalent" to PL/I's PUT DATA for a simple variable */
/*ª* put_data2('a.') to show all a.tail values isn't that easy :-)        */
j=2
abc.j= -4.12
Say put_data('abc.2')     /*ª* Put Data(abc(2)) */
string=put_data('abc.2')  /*ª* Put string(string) Data(abc(2)) */
Say string
Exit
put_data:
Parse Arg variable
return(variable'='''value(variable)'''')
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Reflection-List-properties\reflection-list-properties-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
