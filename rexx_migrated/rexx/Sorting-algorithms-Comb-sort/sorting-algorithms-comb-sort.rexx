/*�*REXX program  sorts  and displays  a  stemmed array  using the  comb sort  algorithm. */
call gen                                         /*�*generate the   @   array elements.   */
call show    'before sort'                       /*�*display the  before  array elements. */
say  copies('▒', 60) /*�*display a separator line  (a fence). */
call combSort    newV4                               /*�*invoke the comb sort (with # entries)*/
call show    ' after sort'                       /*�*display the   after  array elements. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
combSort: procedure expose newV1.;   parse arg N     /*�*N:  is the number of  @  elements.   */
g= N-1                                 /*�*G:  is the gap between the sort COMBs*/
do  until g<=1 & done;  done= 1 /*�*assume sort is done  (so far).       */
g= g * 0.8  % 1                 /*�*equivalent to:   g= trunc( g / 1.25) */
if g==0  then g= 1              /*�*handle case of the gap is too small. */
do j=1  until newV2>=N;  newV2= j+g  /*�*$:     a temporary index  (pointer). */
if newV1.j>newV1.newV2  then do;   newV3= newV1.j;    newV1.j= newV1.newV2;   newV1.newV2= newV3;   done= 0;   end
end   /*�*j*/
end     /*�*until*/               /*�* [↑]  swap two elements in the array.*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=;     newV1.1  = '----polygon---  sides'  ;              newV1.12 = "dodecagon         12"
newV1.2  = '============== =======' ;              newV1.13 = "tridecagon        13"
newV1.3  = 'triangle           3'   ;              newV1.14 = "tetradecagon      14"
newV1.4  = 'quadrilateral      4'   ;              newV1.15 = "pentadecagon      15"
newV1.5  = 'pentagon           5'   ;              newV1.16 = "hexadecagon       16"
newV1.6  = 'hexagon            6'   ;              newV1.17 = "heptadecagon      17"
newV1.7  = 'heptagon           7'   ;              newV1.18 = "octadecagon       18"
newV1.8  = 'octagon            8'   ;              newV1.19 = "enneadecagon      19"
newV1.9  = 'nonagon            9'   ;              newV1.20 = "icosagon          20"
newV1.10 = 'decagon           10'   ;              newV1.21 = "hectogon         100"
newV1.11 = 'hendecagon        11'   ;              newV1.22 = "chiliagon       1000"
newV1.23 = "myriagon       10000"
do newV4=1  while  newV1.newV4\=='';  end    /*�*find how many elements in @ */
newV4= newV4-1;     w= length(newV4);           return          /*�*adjust # because of DO loop.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:     do k=1  for newV4; say right('element',15) right(k,w)  arg(1)":"  newV1.k;  end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Comb-sort\sorting-algorithms-comb-sort.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
