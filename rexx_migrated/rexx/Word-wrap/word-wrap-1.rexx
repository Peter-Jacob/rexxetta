/*�*REXX program  reads  a file  and  displays  it to the screen  (with word wrap).       */
parse arg iFID width .                           /*�*obtain optional arguments from the CL*/
if  iFID=='' |  iFID==","  then  iFID='LAWS.TXT' /*�*Not specified?  Then use the default.*/
if width=='' | width==","  then width=linesize() /*�* "      "         "   "   "     "    */
newV1=                                               /*�*number of words in the file (so far).*/
do  while lines(iFID)\==0            /*�*read from the file until End-Of-File.*/
newV1=newV1 linein(iFID)                     /*�*get a record  (line of text).        */
end   /*�*while*/
newV2=word(newV1,1)                                      /*�*initialize  $  with the first word.  */
do k=2  for words(newV1)-1;  x=word(newV1,k) /*�*parse until text (@) exhausted.      */
newV3=newV2 x                                /*�*append it to the  $  list and test.  */
if length(newV3)>=width  then do;  say newV2 /*�*this word a bridge too far?    > w.  */
newV3=x   /*�*assign this word to the next line.   */
end
newV2=newV3                                  /*�*new words (on a line)  are OK so far.*/
end   /*�*m*/
if newV2\==''  then say newV2                            /*�*handle any residual words (overflow).*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-wrap\word-wrap-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
