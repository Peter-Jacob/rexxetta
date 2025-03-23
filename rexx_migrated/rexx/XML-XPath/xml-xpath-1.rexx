/*ª*REXX program to parse various queries on an XML document  (from a file).    */
iFID='XPATH.XML'                       /*ª*name of the input  XML  file (doc).  */
newV2=                                     /*ª*string will contain the file's text. */
do j=1  while  lines(iFID)\==0    /*ª*read the entire file into a string.  */
newV2=newV2 linein(iFID)                  /*ª*append the line to the  $  string.   */
end   /*ª*j*/
/*ª* [â†“]  show 1st  ITEM  in the document*/
parse var newV2  '<item '  item  "</item>"
say center('first item:',length(space(item)),'â”€')     /*ª*display a nice header.*/
say space(item)
/*ª* [â†“]  show all PRICES in the document*/
prices=                                /*ª*nullify the list and add/append to it*/
newV1=newV2                                   /*ª*start with a fresh copy of document. */
do  until newV1=''                   /*ª* [â†“]  keep parsing string until done.*/
parse var newV1  '<price>'   price   '</price>' newV1
prices=prices price               /*ª*add/append the price to the list.    */
end   /*ª*until*/
say
say center('prices:',length(space(prices)),'â”€')       /*ª*display a nice header.*/
say space(prices)
/*ª* [â†“]  show all  NAMES in the document*/
names.=                                /*ª*nullify the list and add/append to it*/
L=length(' names: ')                   /*ª*maximum length of any one list name. */
newV1=newV2                                   /*ª*start with a fresh copy of document. */
do newV3=1  until newV1=''               /*ª* [â†“]  keep parsing string until done.*/
parse var newV1  '<name>'   names.newV3   '</name>'   newV1
L=max(L,length(names.newV3))          /*ª*L:  is used to find the widest name. */
end   /*ª*#*/

names.0=newV3-1;                  say      /*ª*adjust the number of names (DO loop).*/
say center('names:',L,'â”€')             /*ª*display a nicely formatted header.   */
do k=1  for names.0               /*ª*display all the names in the list.   */
say names.k                       /*ª*display a name from the  NAMES  list.*/
end   /*ª*k*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\XML-XPath\xml-xpath-1.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
