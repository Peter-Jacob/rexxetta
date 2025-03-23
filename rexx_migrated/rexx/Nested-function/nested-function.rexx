/*�*REXX program demonstrates that functions can be nested  (an outer and inner function).*/
ctr= 0                                           /*�*initialize the   CTR   REXX variable.*/
call MakeList '. '                               /*�*invoke  MakeList  with the separator.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MakeItem: parse arg sep,text;    ctr= ctr + 1    /*�*bump the counter variable.           */
say ctr  ||  sep  ||  word(newV1, ctr)     /*�*display three thingys ───► terminal. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MakeList: parse arg sep; newV1= 'first second third' /*�*obtain an argument;  define a string.*/
do  while  ctr<3            /*�*keep truckin'  until  finished.      */
call MakeItem  sep, newV1       /*�*invoke the   MakeItem   function.    */
end   /*�*while*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nested-function\nested-function.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
