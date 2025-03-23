/*�*REXX program to parse various queries on an XML document  (from a file).    */
iFID='XPATH.XML'                       /*�*name of the input  XML  file (doc).  */
newV9=                                     /*�*string will contain the file's text. */
do j=1  while  lines(iFID)\==0    /*�*read the entire file into a string.  */
newV9=newV9 linein(iFID)                  /*�*append the line to the  $  string.   */
end   /*�*j*/
/*�* [↓]  display 1st ITEM in document.  */
call parser 'item', 0                  /*�*go and parse the all the  ITEMs.     */
say center('first item:',newV5.1,'─')     /*�*display a nicely formatted header.   */
say newV6.1;    say                        /*�*display the first  ITEM  found.      */

call parser 'price'                    /*�*go and parse all the   PRICEs.       */
say center('prices:',length(newV4),'─')  /*�*display a nicely formatted header.   */
say newV4;    say                        /*�*display a list of all the prices.    */

call parser 'name'
say center('names:',newV8,'─')            /*�*display a nicely formatted header.   */
do k=1  for newV10  /*�*display all the names in the list.   */
say newV6.k        /*�*display a name from the  NAMES  list.*/
end   /*�*k*/
exit                                   /*�*stick a fork in it,  we're all done. */
/*�*────────────────────────────────────────────────────────────────────────────*/
parser:  parse arg yy,tail,,newV6. newV3. newV4;   newV7=newV9;  newV8=9;  yb='<'yy;   ye='</'yy">"
tail=word(tail 1, 1)                                /*�*use a tail  ">"  or not?*/
do newV10=1  until  newV7=''                          /*�*parse complete XML doc. */
if tail  then parse  var  newV7  newV1 '>' newV3.newV10 newV2 newV7         /*�*find meat.*/
else parse  var  newV7  newV1     newV3.newV10 newV2 newV7         /*�*  "    "  */
newV6.newV10=space(newV3.newV10);   newV4=space(newV4 newV6.newV10)         /*�*shrink;  @@@=list of YY.*/
newV5.newV10=length(newV6.newV10);  newV8=max(newV8,newV5.newV10)            /*�*length; maximum length. */
end   /*�*#*/
newV10=newV10-1                                               /*�*adjust # of thing found.*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-XPath\xml-xpath-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
