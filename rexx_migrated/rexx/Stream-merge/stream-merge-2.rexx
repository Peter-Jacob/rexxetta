/*ͺ*REXX pgm reads sorted files (1.TXT, 2.TXT, Β·Β·Β·),  and writes sorted data ββββΊ ALL.TXT */
newV1.=copies('ff'x, 1e4); call lineout 'ALL.TXT',,1 /*ͺ*no value should be larger than this. */
do n=1  until newV1.n==newV1.;   call rdr n;   end  /*ͺ*read any number of appropriate files.*/
n=n-1                                            /*ͺ*fix N 'cause read a nonβexistent file*/
do forever;              y=newV1.;   newV2=0        /*ͺ*find the lowest value for  N  values.*/
do k=1  for n; if newV1.k==newV1. then call rdr k /*ͺ*Not defined?  Then read a file record*/
if newV1.k<<y   then do;   y=newV1.k;  newV2=k;  end  /*ͺ*Lowest so far?  Mark this as minimum.*/
end   /*ͺ*k*/                               /*ͺ* [β]  note use of  << (exact compare)*/
if newV2==0  then exit                          /*ͺ*stick a fork in it,  we're all done. */
call lineout  'ALL.TXT', newV1.newV2;    say newV1.newV2    /*ͺ*write value to a file;  also display.*/
call rdr newV2                                  /*ͺ*reβpopulate a value from the # file. */
end   /*ͺ*forever*/                           /*ͺ*keep reading/merging until exhausted.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rdr: arg z;    newV1.z= newV1.;    f= z'.TXT';    if lines(f)\==0  then newV1.z= linein(f);     return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stream-merge\stream-merge-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
