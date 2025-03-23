/*�*REXX program constructs the largest integer  from an integer list using concatenation.*/
newV1.=.;     newV1.1 =   1   34    3  98  9  76  45  4  /*�*the  1st  integer list to be used.   */
newV1.2 =  54  546  548  60                /*�* "   2nd     "      "   "  "   "     */
newV1.3 =   4   45   54   5                /*�* "   3rd     "      "   "  "   "     */
w=0                                              /*�* [↓]   process all the integer lists.*/
do j=1  while newV1.j\==.;         z= space(newV1.j) /*�*keep truckin' until lists exhausted. */
w=max(w, length(z) );          newV2=            /*�*obtain maximum width to align output.*/
do  while z\='';  idx= 1;  big= norm(1)  /*�*keep examining the list  until  done.*/
do k=2  to  words(z);    newV3= norm(k)    /*�*obtain an a number from the list.    */
L= max(length(big), length(newV3) )        /*�*get the maximum length of the integer*/
if left(newV3, L, left(newV3, 1) )   <<=   left(big, L, left(big, 1) )    then iterate
big= newV3;                  idx= k        /*�*we found a new biggie (and the index)*/
end   /*�*k*/                            /*�* [↑]  find max concatenated integer. */
z= delword(z, idx, 1)                    /*�*delete this maximum integer from list*/
newV2= newV2  ||  big                            /*�*append   "     "       "    ───►  $. */
end     /*�*while z*/                      /*�* [↑]  process all integers in a list.*/
say 'largest concatenatated integer from '  left( space(newV1.j), w)    " is ─────► "    newV2
end         /*�*j*/                            /*�* [↑]  process each list of integers. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
norm: arg i;  newV3= word(z, i);  er= '***error***';  if left(newV3, 1)=="-"  then newV3= substr(newV3, 2)
if \datatype(newV3,'W')  then do; say er newV3 "isn't an integer."; exit 13; end; return newV3/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Largest-int-from-concatenated-ints\largest-int-from-concatenated-ints-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
