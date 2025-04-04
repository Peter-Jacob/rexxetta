/*ͺ*REXX program generates & displays a SternβBrocot sequence; finds 1βbased indices; GCDs*/
parse arg N idx fix chk .                        /*ͺ*get optional arguments from the C.L. */
if   N=='' |   N==","  then   N=   15            /*ͺ*Not specified?  Then use the default.*/
if idx=='' | idx==","  then idx=   10            /*ͺ* "      "         "   "   "     "    */
if fix=='' | fix==","  then fix=  100            /*ͺ* "      "         "   "   "     "    */
if chk=='' | chk==","  then chk= 1000            /*ͺ* "      "         "   "   "     "    */

if N>0  then say center('the first'   N   "numbers in the SternβBrocot sequence", 70, 'β')
a= SternnewV2Brocot(N)                               /*ͺ*invoke function to generate sequence.*/
say a                                            /*ͺ*display the sequence to the terminal.*/
say
say center('the 1βbased index for the first'       idx        "integers",   70, 'β')
a= SternnewV2Brocot(-idx)                            /*ͺ*invoke function to generate sequence.*/
w= length(idx);        do i=1  for idx
say 'for '   right(i, w)",  the index is: "          wordpos(i, a)
end   /*ͺ*i*/
say
say center('the 1βbased index for'  fix, 70, "β")
a= SternnewV2Brocot(-fix)                            /*ͺ*invoke function to generate sequence.*/
say 'for '       fix",  the index is: "      wordpos(fix, a)
say
if chk<2  then exit 0
say center('checking if all two consecutive members have a GCD=1', 70, 'β')
a= SternnewV2Brocot(chk)                             /*ͺ*invoke function to generate sequence.*/
do c=1  for chk-1;    if gcd(subword(a, c, 2))==1  then iterate
say 'GCD check failed at index'         c;         exit 13
end   /*ͺ*c*/
say
say 'βββββ All '     chk     " two consecutive members have a GCD of unity."
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gcd: procedure; newV1=;     do i=1  for arg();     newV1= newV1 arg(i)              /*ͺ*get arg list. */
end   /*ͺ*i*/
parse var newV1 x z .;                if x=0  then x= z                /*ͺ*is zero case? */
x=abs(x)                                                           /*ͺ*use absolute x*/
do j=2  to words(newV1);    y=abs( word(newV1, j) )
if y=0  then iterate                                     /*ͺ*ignore zeros. */
do  until y==0;      parse value x//y y  with  y x    /*ͺ* βββheavy work*/
end   /*ͺ*until*/
end      /*ͺ*j*/
return x                                                           /*ͺ*return the GCD*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
SternnewV2Brocot:  parse arg h 1 f;                newV1= 1 1;           if h<0  then h= 1e9
else f= 0
f= abs(f)
do k=2  until words(newV1)>=h  |  wordpos(f, newV1)\==0
newV2= word(newV1, k);      newV1= newV1   (newV2 + word(newV1, k-1) )   newV2
end   /*ͺ*k*/
if f==0  then return subword(newV1, 1, h)
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stern-Brocot-sequence\stern-brocot-sequence.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
