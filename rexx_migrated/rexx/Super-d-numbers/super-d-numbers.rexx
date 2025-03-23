/*ª*REXX program computes and displays the first  N  superâ”€d  numbers for D from LO to HI.*/
numeric digits 100                               /*ª*ensure enough decimal digs for calc. */
parse arg n LO HI .                              /*ª*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n= 10                 /*ª*the number of superâ”€d numbers to calc*/
if LO=='' | LO==","  then LO=  2                 /*ª*low  end of  D  for the superâ”€d nums.*/
if HI=='' | HI==","  then HI=  9                 /*ª*high  "   "  "   "   "     "      "  */
/*ª* [â†“]   process  D  from  LO â”€â”€â–º  HI. */
do d=LO  to HI;     newV1= 0;     newV2=            /*ª*count & list of superâ”€d nums (so far)*/
z= copies(d, d)                             /*ª*the string that is being searched for*/
do j=2  until newV1==n                    /*ª*search for superâ”€d numbers 'til found*/
if pos(z, d * j**d)==0  then iterate  /*ª*does product have the required reps? */
newV1= newV1 + 1;               newV2= newV2 j        /*ª*bump counter;  add the number to list*/
end   /*ª*j*/
say
say center(' the first '     n     " super-"d 'numbers ',  digits(),  "â•")
say newV2
end   /*ª*d*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Super-d-numbers\super-d-numbers.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
