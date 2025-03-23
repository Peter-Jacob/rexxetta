/*�*REXX pgm reads sorted files (1.TXT, 2.TXT, ···),  and writes sorted data ───► ALL.TXT */
newV1.=copies('ff'x, 1e4); call lineout 'ALL.TXT',,1 /*�*no value should be larger than this. */
do n=1  until newV1.n==newV1.;   call rdr n;   end  /*�*read any number of appropriate files.*/
n=n-1                                            /*�*fix N 'cause read a non─existent file*/
do forever;              y=newV1.;   newV2=0        /*�*find the lowest value for  N  values.*/
do k=1  for n; if newV1.k==newV1. then call rdr k /*�*Not defined?  Then read a file record*/
if newV1.k<<y   then do;   y=newV1.k;  newV2=k;  end  /*�*Lowest so far?  Mark this as minimum.*/
end   /*�*k*/                               /*�* [↑]  note use of  << (exact compare)*/
if newV2==0  then exit                          /*�*stick a fork in it,  we're all done. */
call lineout  'ALL.TXT', newV1.newV2;    say newV1.newV2    /*�*write value to a file;  also display.*/
call rdr newV2                                  /*�*re─populate a value from the # file. */
end   /*�*forever*/                           /*�*keep reading/merging until exhausted.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rdr: arg z;    newV1.z= newV1.;    f= z'.TXT';    if lines(f)\==0  then newV1.z= linein(f);     return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stream-merge\stream-merge-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
