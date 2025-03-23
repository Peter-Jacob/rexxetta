/*ª*REXX program finds & displays the next  N  palindromic dates starting after 2020â”€02â”€02*/
/*ª*                                                                      â”€â”€â”€â”€â”€           */
parse arg n from .                               /*ª*obtain optional argumets from the CL*/
if    n=='' |    n==","  then    n= 15           /*ª*Not specified?  Then use the default.*/
if from=='' | from==","  then from= '2020-02-02' /*ª* "      "         "   "   "     "    */
newV1= 0                                             /*ª*the count of palindromic dates so far*/
do j=date('Base', from, "ISO")+1 until newV1==n /*ª*find palindromic dates 'til  N  found*/
aDate= date('ISO', j, "Base")               /*ª*convert a "base" date to ISO format. */
newV2= space( translate(aDate, , '-'),  0)      /*ª*elide the dashes  (-)  in this date. */
if newV2\==reverse(newV2)  then iterate             /*ª*Not palindromic?  Then skip this date*/
say 'a palindromic date: '        aDate     /*ª*display a palindromic date â”€â”€â–º term. */
newV1= newV1 + 1                                    /*ª*bump the counter of palindromic dates*/
end   /*ª*j*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Palindrome-dates\palindrome-dates.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
