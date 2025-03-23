/*�*REXX program performs range consolidation (they can be [equal] ascending/descending). */
newV1.=                                              /*�*define the default for range sets.   */
parse arg newV1.1                                    /*�*obtain optional arguments from the CL*/
if newV1.1=''  then do                               /*�*Not specified?  Then use the defaults*/
newV1.1= '[1.1, 2.2]'
newV1.2= '[6.1, 7.2], [7.2, 8.3]'
newV1.3= '[4, 3], [2, 1]'
newV1.4= '[4, 3], [2, 1], [-1, -2], [3.9, 10]'
newV1.5= '[1, 3], [-6, -1], [-4, -5], [8, 2], [-6, -6]'
newV1.6= '[]'
end

do j=1  while newV1.j\=='';   newV3= newV1.j          /*�*process each of the range sets.      */
say copies('═', 75)                       /*�*display a fence between range sets.  */
say '         original ranges:'     newV3     /*�*display the original range set.      */
newV3= order(newV3)                               /*�*order low and high ranges; normalize.*/
call xSort  words(newV3)                      /*�*sort the ranges using a simple sort. */
newV3= merge(newV3)                               /*�*consolidate the ranges.              */
say '     consolidated ranges:'     newV3     /*�*display the consolidated range set.  */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
merge: procedure expose newV2.; parse arg y
if words(y)<2  then signal build          /*�*Null or only 1 range?  Skip merging. */

do j=1  to newV2.0-1;         if newV2.j==''  then iterate      /*�*skip deleted ranges.*/
do k=j+1  to  newV2.0;      if newV2.k==''  then iterate      /*�*  "     "       "   */
parse var  newV2.j  a   b;  parse var  newV2.k  aa  bb        /*�*extract low and high*/
/*�*■■■■►*/   if a<=aa & b>=bb  then  do; newV2.k=;  iterate;            end  /*�*within a range*/
/*�*■■■■►*/   if a<=aa & b>=aa  then  do; newV2.j= a bb; newV2.k=; iterate;  end  /*�*abutted ranges*/
end   /*�*k*/
end     /*�*j*/
build: z=
do r=1  for newV2.0;  z= z translate(newV2.r, ',', " ");  end   /*�*r*/   /*�*add comma*/
f=;   do s=1  for words(z);   f= f '['word(z, s)"], ";  end   /*�*s*/   /*�*add [ ], */
if f==''  then return '[]'                                            /*�*null set.*/
return space( changestr(',',  strip( space(f), 'T', ","), ", ") )     /*�*add blank*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
order: procedure expose newV2.; parse arg y,,z;  newV2.= /*�*obtain arguments from the invocation.*/
y= space(y, 0)                            /*�*elide superfluous blanks in the sets.*/
do k=1  while y\==''  &  y\=='[]'      /*�*process ranges while range not blank.*/
y= strip(y, 'L', ",")                  /*�*elide commas between sets of ranges. */
parse var  y   '['  L  ","  H  ']'   y /*�*extract  the "low" and "high" values.*/
if H<L  then parse value  L H with H L /*�*order     "    "    "     "      "   */
L= L / 1;     H= H / 1                 /*�*normalize the  L  and the  H  values.*/
newV2.k= L H;     z= z L','H               /*�*re─build the set w/o and with commas.*/
end   /*�*k*/                            /*�* [↓]  at this point, K is one to big.*/
newV2.0= k - 1                                /*�*keep track of the number of ranges.  */
return strip(z)                           /*�*elide the extra leading blank in set.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
xSort: procedure expose newV2.; parse arg n          /*�*a simple sort for small set of ranges*/
do j=1  to n-1;                        newV4= newV2.j
do k=j+1  to n; if word(newV2.k,1)>=word(newV4,1)  then iterate; newV2.j=newV2.k; newV2.k=newV4; newV4=newV2.j
end   /*�*k*/
end     /*�*j*/;        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-consolidation\range-consolidation.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
