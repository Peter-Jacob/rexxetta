/*�*REXX program computes and displays  any  range  of the  Mian─Chowla  integer sequence.*/
parse arg LO HI .                                /*�*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=  1                 /*�*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI= 30                 /*�* "       "        "   "   "     "    */
r.= 0                                            /*�*initialize the rejects stemmed array.*/
newV2=  0                                            /*�*count of numbers in sequence (so far)*/
newV3=                                               /*�*the Mian─Chowla sequence  (so far).  */
do t=1  until newV2=HI;      newV1.= r.0              /*�*process numbers until range is filled*/
do i=1    for t;       if r.i  then iterate /*�*I  already rejected?  Then ignore it.*/
do j=i  for t-i+1;   if r.j  then iterate /*�*J     "        "        "     "    " */
newV4= i + j                                  /*�*calculate the sum of   I   and   J.  */
if newV1.newV4  then do;  r.t= 1; iterate t;  end /*�*reject  T  from Mian─Chowla sequence.*/
newV1.newV4= 1                                    /*�*mark  _  as one of the sequence sums.*/
end   /*�*j*/
end     /*�*i*/
newV2= newV2 + 1                                      /*�*bump the counter of terms in the list*/
if newV2>=LO  then  if  newV2<=HI  then newV3= newV3 t        /*�*In the specified range?  Add to list.*/
end       /*�*t*/
/*�*stick a fork in it,  we're all done. */
say 'The Mian─Chowla sequence for terms '      LO      "──►"       HI      ' (inclusive):'
say strip(newV3)                                     /*�*ignore the leading superfluous blank.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mian-Chowla-sequence\mian-chowla-sequence.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
