/*ª*REXX program sorts a list of things (or items) using the  patience sort  algorithm.   */
parse arg xxx;     say ' input: '      xxx       /*ª*obtain a list of things from the C.L.*/
n= words(xxx);     newV3= 0;       newV1.= 1             /*ª*N:  # of things;  #:  number of piles*/
newV2.=                                              /*ª* [â†“]  append or create a pile  (@.j) */
do i=1  for n;              q= word(xxx, i)   /*ª* [â†“]  construct the piles of things. */
do j=1  for newV3                    /*ª*add the   Q   thing (item) to a pile.*/
if q>word(newV2.j,1)  then iterate   /*ª*Is this item greater?   Then skip it.*/
newV2.j= q  newV2.j;           iterate i /*ª*add this item to the top of the pile.*/
end   /*ª*j*/                      /*ª* [â†‘]  find a pile, or make a new pile*/
newV3= newV3 + 1                                      /*ª*increase the pile count.             */
newV2.newV3= q                                        /*ª*define a new pile.                   */
end                /*ª*i*/                      /*ª*we are done with creating the piles. */
newV4=                                               /*ª* [â†“]   build a thingy list from piles*/
do k=1  until  words(newV4)==n                    /*ª*pick off the smallest from the piles.*/
newV5=                                            /*ª*this is the smallest thingy so farÂ·Â·Â·*/
do m=1  for  newV3;     z= word(newV2.m, newV1.m)  /*ª*traipse through many piles of items. */
if z==''  then iterate                 /*ª*Is this pile null?    Then skip pile.*/
if newV5==''  then newV5= z                    /*ª*assume this one is the low pile value*/
if newV5>=z   then do;  newV5= z;  p= m;  end  /*ª*found a low value in a pile of items.*/
end   /*ª*m*/                            /*ª*the traipsing is done, we found a low*/
newV4= newV4 newV5                                        /*ª*add to the output thingy  ($)  list. */
newV1.p= newV1.p + 1                                  /*ª*bump the thingy pointer in pile  P.  */
end          /*ª*k*/                            /*ª* [â†‘]  each iteration finds a low item*/
/*ª* [â†“]  string  $  has a leading blank.*/
say 'output: '       strip(newV4)                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Patience-sort\sorting-algorithms-patience-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
