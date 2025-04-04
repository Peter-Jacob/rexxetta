/*ͺ*REXX program finds  symmetric difference  and  symmetric AND  (between two lists).    */
a= '["John", "Serena", "Bob", "Mary", "Serena"]' /*ͺ*note the duplicate element:  Serena  */
b= '["Jim", "Mary", "John", "Jim", "Bob"]'       /*ͺ*  "   "       "       "      Jim     */
a.=0;   SD.=0;   SA.=0;    SD=;     SA=          /*ͺ*falsify booleans; zero & nullify vars*/
a.1=a;         say 'ββββββββββββββlist A ='  a   /*ͺ*assign a list and display it to term.*/
a.2=b;         say 'ββββββββββββββlist B ='  b   /*ͺ*   "   "   "   "     "     "  "   "  */
/*ͺ* [β]  parse the two lists.           */
do k=1  for 2                                /*ͺ*process both lists  (stemmed array). */
a.k=strip( strip(a.k, , "["), ,']')          /*ͺ*strip leading and trailing brackets. */
do j=1  until a.k=''              /*ͺ*parse names  [they may have blanks]. */
a.k=strip(a.k, , ',')             /*ͺ*strip all commas (if there are any). */
parse var  a.k   '"'  newV1  '"'  a.k /*ͺ*obtain the name of the list.         */
a.k.j=newV1                           /*ͺ*store the name of the list.          */
a.k.newV1=1                           /*ͺ*make a boolean value.                */
end   /*ͺ*j*/
a.k.0=j-1                                    /*ͺ*the number of this list  (of names). */
end              /*ͺ*k*/
say                                              /*ͺ* [β]  find the symmetric difference. */
do k=1  for 2;             ko=word(2 1, k)   /*ͺ*process both lists;   KO=other list. */
do j=1  for a.k.0;       newV1=a.k.j           /*ͺ*process the list names.              */
if \a.ko.newV1 & \SD.newV1  then do;   SD.newV1=1      /*ͺ*if not in both, then  Β·Β·Β·            */
SD=SD  '"'newV1'",'   /*ͺ*add to symmetric difference list.    */
end
end   /*ͺ*j*/
end     /*ͺ*k*/
/*ͺ* [β]  SD β‘  symmetric difference.    */
SD= "["strip( strip(SD), 'T', ",")']'            /*ͺ*clean up and add brackets [ ]  to it.*/
say 'symmetric difference ='   SD                /*ͺ*display the symmetric difference.    */
/*ͺ* [β]  locate the symmetric AND.      */
do j=1  for a.1.0;     newV1=a.1.j                /*ͺ*process the   A   list names.        */
if a.1.newV1 & a.2.newV1 & \SA.newV1  then do;   SA.newV1=1   /*ͺ*if it's common to both, then  Β·Β·Β·    */
SA=SA '"'newV1'",' /*ͺ*add to symmetric AND  list.          */
end
end   /*ͺ*j*/
say                                              /*ͺ* [β]  SA β‘  symmetric AND.           */
SA= "["strip( strip(SA), 'T', ",")']'            /*ͺ*clean up and add brackets [ ]  to it.*/
say '       symmetric AND ='   SA                /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Symmetric-difference\symmetric-difference-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
