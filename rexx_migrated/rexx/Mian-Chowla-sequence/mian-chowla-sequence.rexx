/*ª*REXX program computes and displays  any  range  of the  Mianâ”€Chowla  integer sequence.*/
parse arg LO HI .                                /*ª*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=  1                 /*ª*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI= 30                 /*ª* "       "        "   "   "     "    */
r.= 0                                            /*ª*initialize the rejects stemmed array.*/
newV2=  0                                            /*ª*count of numbers in sequence (so far)*/
newV3=                                               /*ª*the Mianâ”€Chowla sequence  (so far).  */
do t=1  until newV2=HI;      newV1.= r.0              /*ª*process numbers until range is filled*/
do i=1    for t;       if r.i  then iterate /*ª*I  already rejected?  Then ignore it.*/
do j=i  for t-i+1;   if r.j  then iterate /*ª*J     "        "        "     "    " */
newV4= i + j                                  /*ª*calculate the sum of   I   and   J.  */
if newV1.newV4  then do;  r.t= 1; iterate t;  end /*ª*reject  T  from Mianâ”€Chowla sequence.*/
newV1.newV4= 1                                    /*ª*mark  _  as one of the sequence sums.*/
end   /*ª*j*/
end     /*ª*i*/
newV2= newV2 + 1                                      /*ª*bump the counter of terms in the list*/
if newV2>=LO  then  if  newV2<=HI  then newV3= newV3 t        /*ª*In the specified range?  Add to list.*/
end       /*ª*t*/
/*ª*stick a fork in it,  we're all done. */
say 'The Mianâ”€Chowla sequence for terms '      LO      "â”€â”€â–º"       HI      ' (inclusive):'
say strip(newV3)                                     /*ª*ignore the leading superfluous blank.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mian-Chowla-sequence\mian-chowla-sequence.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
