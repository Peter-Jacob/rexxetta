/*ª*REXX program finds  N  semordnilap pairs using a specified dictionary  (UNIXDICT.TXT).*/
parse arg n iFID .                               /*ª*obtain optional argument from the CL.*/
if    n=='' |    n=="," then    n= 5             /*ª*Not specified?  Then use the default.*/
if iFID=='' | iFID=="," then iFID='UNIXDICT.TXT' /*ª* "      "         "   "   "     "    */
newV2= 0                                             /*ª*number of semordnilaps  (so far).    */
newV1.=                                              /*ª*caseless nonâ”€duplicated dict. words. */
do while lines(iFID)\==0;  newV3= linein(iFID);  u= space(newV3, 0);  upper u  /*ª*get a word.*/
if length(u)<2 | newV1.u\==''  then iterate      /*ª*word can't be a unique semordnilap.  */
r= reverse(u)                                /*ª*obtain reverse of the dictionary word*/
if newV1.r\==''  then do;   newV2= newV2 + 1             /*ª*found a semordnilap word; bump count.*/
if newV2<=n  then say right(newV1.r,  max(32, length(newV1.r) ) )','   u
end
newV1.u= newV3                                       /*ª*define reverse of the dictionary word*/
end   /*ª*while*/                              /*ª*stick a fork in it,  we're all done. */
say
say "There're "     newV2     ' unique semordnilap pairs in the dictionary file: '    iFID
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semordnilap\semordnilap-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
