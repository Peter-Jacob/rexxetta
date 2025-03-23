/*�*REXX program computes and displays the first  N  super─d  numbers for D from LO to HI.*/
numeric digits 100                               /*�*ensure enough decimal digs for calc. */
parse arg n LO HI .                              /*�*obtain optional arguments from the CL*/
if  n=='' |  n==","  then  n= 10                 /*�*the number of super─d numbers to calc*/
if LO=='' | LO==","  then LO=  2                 /*�*low  end of  D  for the super─d nums.*/
if HI=='' | HI==","  then HI=  9                 /*�*high  "   "  "   "   "     "      "  */
/*�* [↓]   process  D  from  LO ──►  HI. */
do d=LO  to HI;     newV1= 0;     newV2=            /*�*count & list of super─d nums (so far)*/
z= copies(d, d)                             /*�*the string that is being searched for*/
do j=2  until newV1==n                    /*�*search for super─d numbers 'til found*/
if pos(z, d * j**d)==0  then iterate  /*�*does product have the required reps? */
newV1= newV1 + 1;               newV2= newV2 j        /*�*bump counter;  add the number to list*/
end   /*�*j*/
say
say center(' the first '     n     " super-"d 'numbers ',  digits(),  "═")
say newV2
end   /*�*d*/                                 /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Super-d-numbers\super-d-numbers.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
