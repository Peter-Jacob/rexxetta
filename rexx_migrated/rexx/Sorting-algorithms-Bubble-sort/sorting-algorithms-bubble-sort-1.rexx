/*�*REXX program sorts an array  (of any kind of items)  using the  bubble─sort algorithm.*/
call gen                                         /*�*generate the array elements  (items).*/
call show   'before sort'                        /*�*show the  before  array elements.    */
say copies('▒', 70)                         /*�*show a separator line (before/after).*/
call bSort         newV3                             /*�*invoke the bubble sort  with # items.*/
call show   ' after sort'                        /*�*show the  after   array elements.    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bSort: procedure expose newV1.;  parse arg n         /*�*N: is the number of @ array elements.*/
do m=n-1  by -1  until ok;         ok=1 /*�*keep sorting the  @ array until done.*/
do j=1  for m;  k=j+1;  if newV1.j<=newV1.k  then iterate       /*�*elements in order? */
newV2=newV1.j;  newV1.j=newV1.k;  newV1.k=newV2;         ok=0 /*�*swap two elements;  flag as not done.*/
end   /*�*j*/
end     /*�*m*/;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=;         newV1.1 = '---letters of the Hebrew alphabet---' ;   newV1.13= "kaph    [kaf]"
newV1.2 = '====================================' ;   newV1.14= "lamed"
newV1.3 = 'aleph   [alef]'                       ;   newV1.15= "mem"
newV1.4 = 'beth    [bet]'                        ;   newV1.16= "nun"
newV1.5 = 'gimel'                                ;   newV1.17= "samekh"
newV1.6 = 'daleth  [dalet]'                      ;   newV1.18= "ayin"
newV1.7 = 'he'                                   ;   newV1.19= "pe"
newV1.8 = 'waw     [vav]'                        ;   newV1.20= "sadhe   [tsadi]"
newV1.9 = 'zayin'                                ;   newV1.21= "qoph    [qof]"
newV1.10= 'heth    [het]'                        ;   newV1.22= "resh"
newV1.11= 'teth    [tet]'                        ;   newV1.23= "shin"
newV1.12= 'yod'                                  ;   newV1.24= "taw     [tav]"
do newV3=1  until newV1.newV3=='';  end;      newV3=newV3-1  /*�*determine #elements in list; adjust #*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   do j=1  for newV3; say '     element' right(j,length(newV3)) arg(1)":"  newV1.j; end;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bubble-sort\sorting-algorithms-bubble-sort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
