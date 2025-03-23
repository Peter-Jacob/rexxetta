/*ª*REXX pgm generates/displays the   'start â”€â”€â–º end'    elements of the Van Eck sequence.*/
parse arg LO HI newV2 .                              /*ª*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=   1                /*ª*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=  10                /*ª* "      "         "   "   "     "    */
if  newV2=='' |  newV2==","  then  newV2=   0                /*ª* "      "         "   "   "     "    */
newV1=;               z= newV2                          /*ª*$$: old seq:  $: initial value of seq*/
do HI-1;      z= wordpos( reverse(z), reverse(newV1) );          newV1= newV2;          newV2= newV2 z
end   /*ª*HI-1*/                              /*ª*REVERSE allows backwards search in $.*/
/*ª*stick a fork in it,  we're all done. */
say 'terms '  LO  " through "  HI  ' of the Van Eck sequence are: '  subword(newV2,LO,HI-LO+1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Van-Eck-sequence\van-eck-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
