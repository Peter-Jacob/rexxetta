/*ª*REXX program finds  symmetric difference  and  symmetric AND  (between two lists).    */
a= '["John", "Serena", "Bob", "Mary", "Serena"]' /*ª*note the duplicate element:  Serena  */
b= '["Jim", "Mary", "John", "Jim", "Bob"]'       /*ª*  "   "       "       "      Jim     */
a.=0;   SD.=0;   SA.=0;    SD=;     SA=          /*ª*falsify booleans; zero & nullify vars*/
a.1=a;         say 'â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€list A ='  a   /*ª*assign a list and display it to term.*/
a.2=b;         say 'â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€list B ='  b   /*ª*   "   "   "   "     "     "  "   "  */
/*ª* [â†“]  parse the two lists.           */
do k=1  for 2                                /*ª*process both lists  (stemmed array). */
a.k=strip( strip(a.k, , "["), ,']')          /*ª*strip leading and trailing brackets. */
do j=1  until a.k=''              /*ª*parse names  [they may have blanks]. */
a.k=strip(a.k, , ',')             /*ª*strip all commas (if there are any). */
parse var  a.k   '"'  newV1  '"'  a.k /*ª*obtain the name of the list.         */
a.k.j=newV1                           /*ª*store the name of the list.          */
a.k.newV1=1                           /*ª*make a boolean value.                */
end   /*ª*j*/
a.k.0=j-1                                    /*ª*the number of this list  (of names). */
end              /*ª*k*/
say                                              /*ª* [â†“]  find the symmetric difference. */
do k=1  for 2;             ko=word(2 1, k)   /*ª*process both lists;   KO=other list. */
do j=1  for a.k.0;       newV1=a.k.j           /*ª*process the list names.              */
if \a.ko.newV1 & \SD.newV1  then do;   SD.newV1=1      /*ª*if not in both, then  Â·Â·Â·            */
SD=SD  '"'newV1'",'   /*ª*add to symmetric difference list.    */
end
end   /*ª*j*/
end     /*ª*k*/
/*ª* [â†“]  SD â‰¡  symmetric difference.    */
SD= "["strip( strip(SD), 'T', ",")']'            /*ª*clean up and add brackets [ ]  to it.*/
say 'symmetric difference ='   SD                /*ª*display the symmetric difference.    */
/*ª* [â†“]  locate the symmetric AND.      */
do j=1  for a.1.0;     newV1=a.1.j                /*ª*process the   A   list names.        */
if a.1.newV1 & a.2.newV1 & \SA.newV1  then do;   SA.newV1=1   /*ª*if it's common to both, then  Â·Â·Â·    */
SA=SA '"'newV1'",' /*ª*add to symmetric AND  list.          */
end
end   /*ª*j*/
say                                              /*ª* [â†“]  SA â‰¡  symmetric AND.           */
SA= "["strip( strip(SA), 'T', ",")']'            /*ª*clean up and add brackets [ ]  to it.*/
say '       symmetric AND ='   SA                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Symmetric-difference\symmetric-difference-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
