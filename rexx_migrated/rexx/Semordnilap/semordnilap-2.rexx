/*�*REXX program finds  N  semordnilap pairs using a specified dictionary  (UNIXDICT.TXT).*/
parse arg n iFID .                               /*�*obtain optional argument from the CL.*/
if    n=='' |    n=="," then    n= 5             /*�*Not specified?  Then use the default.*/
if iFID=='' | iFID=="," then iFID='UNIXDICT.TXT' /*�* "      "         "   "   "     "    */
newV2= 0                                             /*�*number of semordnilaps  (so far).    */
newV1.=                                              /*�*caseless non─duplicated dict. words. */
do while lines(iFID)\==0;  newV3= linein(iFID);  u= space(newV3, 0);  upper u  /*�*get a word.*/
if length(u)<2 | newV1.u\==''  then iterate      /*�*word can't be a unique semordnilap.  */
r= reverse(u)                                /*�*obtain reverse of the dictionary word*/
if newV1.r\==''  then do;   newV2= newV2 + 1             /*�*found a semordnilap word; bump count.*/
if newV2<=n  then say right(newV1.r,  max(32, length(newV1.r) ) )','   u
end
newV1.u= newV3                                       /*�*define reverse of the dictionary word*/
end   /*�*while*/                              /*�*stick a fork in it,  we're all done. */
say
say "There're "     newV2     ' unique semordnilap pairs in the dictionary file: '    iFID
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semordnilap\semordnilap-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
