/*�*REXX program sorts a list of things (or items) using the  patience sort  algorithm.   */
parse arg xxx;     say ' input: '      xxx       /*�*obtain a list of things from the C.L.*/
n= words(xxx);     newV3= 0;       newV1.= 1             /*�*N:  # of things;  #:  number of piles*/
newV2.=                                              /*�* [↓]  append or create a pile  (@.j) */
do i=1  for n;              q= word(xxx, i)   /*�* [↓]  construct the piles of things. */
do j=1  for newV3                    /*�*add the   Q   thing (item) to a pile.*/
if q>word(newV2.j,1)  then iterate   /*�*Is this item greater?   Then skip it.*/
newV2.j= q  newV2.j;           iterate i /*�*add this item to the top of the pile.*/
end   /*�*j*/                      /*�* [↑]  find a pile, or make a new pile*/
newV3= newV3 + 1                                      /*�*increase the pile count.             */
newV2.newV3= q                                        /*�*define a new pile.                   */
end                /*�*i*/                      /*�*we are done with creating the piles. */
newV4=                                               /*�* [↓]   build a thingy list from piles*/
do k=1  until  words(newV4)==n                    /*�*pick off the smallest from the piles.*/
newV5=                                            /*�*this is the smallest thingy so far···*/
do m=1  for  newV3;     z= word(newV2.m, newV1.m)  /*�*traipse through many piles of items. */
if z==''  then iterate                 /*�*Is this pile null?    Then skip pile.*/
if newV5==''  then newV5= z                    /*�*assume this one is the low pile value*/
if newV5>=z   then do;  newV5= z;  p= m;  end  /*�*found a low value in a pile of items.*/
end   /*�*m*/                            /*�*the traipsing is done, we found a low*/
newV4= newV4 newV5                                        /*�*add to the output thingy  ($)  list. */
newV1.p= newV1.p + 1                                  /*�*bump the thingy pointer in pile  P.  */
end          /*�*k*/                            /*�* [↑]  each iteration finds a low item*/
/*�* [↓]  string  $  has a leading blank.*/
say 'output: '       strip(newV4)                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Patience-sort\sorting-algorithms-patience-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
