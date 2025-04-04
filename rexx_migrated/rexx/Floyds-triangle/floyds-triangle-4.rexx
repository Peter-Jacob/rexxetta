/*ช*REXX program constructs/shows Floyd's triangle for any number of rows in any base โค90.*/
parse arg N radx .                               /*ช*obtain optional arguments from the CL*/
if    N=='' |    N==","  then    N= 5            /*ช*Not specified?  Then use the default.*/
if radx=='' | radx==","  then radx=10            /*ช* "      "         "   "   "     "    */
mx=N * (N+1) % 2  -  N                           /*ช*calculate maximum value of any value.*/
say 'displaying a '  N   " row Floyd's triangle in base"  radx':'  /*ช*display the header.*/
say
newV4=1;  do     r=1  for N;   i=0;            newV5=    /*ช*construct Floyd's triangle row by row*/
do newV4=newV4  for r;    i=i+1                 /*ช*start to construct a row of triangle.*/
newV5=newV5 right(base(newV4, radx),  length( base(mx+i, radx) ) )    /*ช*build triangle row.*/
end   /*ช*#*/
say substr(newV5, 2)                           /*ช*remove 1st leading blank in the line,*/
end      /*ช*r*/                             /*ช* [โ]   introduced by first abutment. */
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
base: procedure; parse arg x 1 ox,toB,inB              /*ช*obtain number, toBase, inBase. */
newV2= 'abcdefghijklmnopqrstuvwxyz'               /*ช*lowercase Latin alphabet.      */
newV1=newV2;        upper newV1                   /*ช*go whole hog and extend 'em.   */
newV3= '0123456789'newV2 || newV1                   /*ช*prefix 'em with numeric digits.*/
newV3=newV3'<>[]{}()?~!@#$%^&*_=|\/;:ยขยฌโ'            /*ช*add some special chars as well.*/
/*ช* [โ]  handles up to base 90,  all chars must be viewable.*/
numeric digits 3000                              /*ช*what the hey, support gihugeics*/
mxB=length(newV3)                                  /*ช*max base (radix) supported here*/
if toB=='' | toB=="," then toB=10                /*ช*if skipped, assume default (10)*/
if inB=='' | inB=="," then inB=10                /*ช* "    "        "      "      " */
if inB<2   | inb>mxB  then call erb 'inBase',inB /*ช*invalid/illegal arg:   inBase. */
if toB<2   | tob>mxB  then call erb 'toBase',toB /*ช*    "      "     "     toBase. */
if x==''              then call erm              /*ช*    "      "     "     number. */
sigX=left(x, 1)                           /*ช*obtain a possible leading sign.*/
if pos(sigX, '-+')\==0  then x=substr(x, 2)      /*ช*X  number has a leading sign?  */
else sigX=               /*ช*           ยทยทยท no leading sign.*/
newV4=0
do j=1  for length(x);  newV5=substr(x, j, 1)  /*ช*convert X, base inB โโโบ base 10*/
v=pos(newV5, newV3)                              /*ช*get the value of this "digit". */
if v==0 | v>inB  then call erd x,j,inB     /*ช*is this an illegal "numeral" ? */
newV4=newV4 * inB + v - 1                          /*ช*construct new num, dig by dig. */
end   /*ช*j*/
y=
do  while  newV4 >= toB                        /*ช*convert #, base 10 โโโบ base toB*/
y=substr(newV3, (newV4 // toB) + 1, 1)y          /*ช*construct the number for output*/
newV4=newV4 % toB                                  /*ช* ยทยทยท and whittle  #  down also.*/
end   /*ช*while*/

y=sigX || substr(newV3, newV4+1, 1)y                   /*ช*prepend the sign if it existed.*/
return y                                         /*ช*return the number in base  toB.*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
erb:  call ser  'illegal'   arg(2)   "base: "   arg(1)   "must be in range:  2โโโบ "    mxB
erd:  call ser  'illegal "digit" in'            x":"     newV5
erm:  call ser  'no argument specified.'
ser:  say; say  '***error***';             say arg(1);     say;      exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyds-triangle\floyds-triangle-4.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
