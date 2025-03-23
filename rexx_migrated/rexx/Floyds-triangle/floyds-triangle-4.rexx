/*�*REXX program constructs/shows Floyd's triangle for any number of rows in any base ≤90.*/
parse arg N radx .                               /*�*obtain optional arguments from the CL*/
if    N=='' |    N==","  then    N= 5            /*�*Not specified?  Then use the default.*/
if radx=='' | radx==","  then radx=10            /*�* "      "         "   "   "     "    */
mx=N * (N+1) % 2  -  N                           /*�*calculate maximum value of any value.*/
say 'displaying a '  N   " row Floyd's triangle in base"  radx':'  /*�*display the header.*/
say
newV4=1;  do     r=1  for N;   i=0;            newV5=    /*�*construct Floyd's triangle row by row*/
do newV4=newV4  for r;    i=i+1                 /*�*start to construct a row of triangle.*/
newV5=newV5 right(base(newV4, radx),  length( base(mx+i, radx) ) )    /*�*build triangle row.*/
end   /*�*#*/
say substr(newV5, 2)                           /*�*remove 1st leading blank in the line,*/
end      /*�*r*/                             /*�* [↑]   introduced by first abutment. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
base: procedure; parse arg x 1 ox,toB,inB              /*�*obtain number, toBase, inBase. */
newV2= 'abcdefghijklmnopqrstuvwxyz'               /*�*lowercase Latin alphabet.      */
newV1=newV2;        upper newV1                   /*�*go whole hog and extend 'em.   */
newV3= '0123456789'newV2 || newV1                   /*�*prefix 'em with numeric digits.*/
newV3=newV3'<>[]{}()?~!@#$%^&*_=|\/;:¢¬≈'            /*�*add some special chars as well.*/
/*�* [↑]  handles up to base 90,  all chars must be viewable.*/
numeric digits 3000                              /*�*what the hey, support gihugeics*/
mxB=length(newV3)                                  /*�*max base (radix) supported here*/
if toB=='' | toB=="," then toB=10                /*�*if skipped, assume default (10)*/
if inB=='' | inB=="," then inB=10                /*�* "    "        "      "      " */
if inB<2   | inb>mxB  then call erb 'inBase',inB /*�*invalid/illegal arg:   inBase. */
if toB<2   | tob>mxB  then call erb 'toBase',toB /*�*    "      "     "     toBase. */
if x==''              then call erm              /*�*    "      "     "     number. */
sigX=left(x, 1)                           /*�*obtain a possible leading sign.*/
if pos(sigX, '-+')\==0  then x=substr(x, 2)      /*�*X  number has a leading sign?  */
else sigX=               /*�*           ··· no leading sign.*/
newV4=0
do j=1  for length(x);  newV5=substr(x, j, 1)  /*�*convert X, base inB ──► base 10*/
v=pos(newV5, newV3)                              /*�*get the value of this "digit". */
if v==0 | v>inB  then call erd x,j,inB     /*�*is this an illegal "numeral" ? */
newV4=newV4 * inB + v - 1                          /*�*construct new num, dig by dig. */
end   /*�*j*/
y=
do  while  newV4 >= toB                        /*�*convert #, base 10 ──► base toB*/
y=substr(newV3, (newV4 // toB) + 1, 1)y          /*�*construct the number for output*/
newV4=newV4 % toB                                  /*�* ··· and whittle  #  down also.*/
end   /*�*while*/

y=sigX || substr(newV3, newV4+1, 1)y                   /*�*prepend the sign if it existed.*/
return y                                         /*�*return the number in base  toB.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
erb:  call ser  'illegal'   arg(2)   "base: "   arg(1)   "must be in range:  2──► "    mxB
erd:  call ser  'illegal "digit" in'            x":"     newV5
erm:  call ser  'no argument specified.'
ser:  say; say  '***error***';             say arg(1);     say;      exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyds-triangle\floyds-triangle-4.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
