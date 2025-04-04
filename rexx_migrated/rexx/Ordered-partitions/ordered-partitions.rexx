//*ͺ*REXX program displays the  ordered partitions  as:   orderedPartitions(i, j, k, Β·Β·Β·). */
call orderedPartitions  2,0,2                    /*ͺ*Note:      2,,2      will also work. */
call orderedPartitions  1,1,1
call orderedPartitions  1,2,0,1                  /*ͺ*Note:      1,2,,1    will also work. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
orderedPartitions: procedure;  newV2=arg();   bot.=;   top.=;   low=;    high=;    d=123456789
t=0                                              /*ͺ*T:   is the sum of all the arguments.*/
do i=1  for newV2;       t=t + arg(i)      /*ͺ*sum all the highest numbers in parts.*/
end   /*ͺ*i*/                            /*ͺ* [β]  may have an omitted argument.  */
hdr= ' partitions for: '                         /*ͺ*define the start of the header text. */
do j=1  for newV2;               newV3= arg(j)         /*ͺ*  _:  is the    Jth   argument.      */
len.j=max(1, newV3)                                /*ͺ*LEN:  length of args.  Β«0 is specialΒ»*/
bot.j=left(d, newV3);         if newV3==0 then bot.j=0 /*ͺ*define the  bottom  number for range.*/
top.j=right(left(d,t),newV3); if newV3==0 then top.j=0 /*ͺ*  "     "     top      "    "    "   */
newV1.j=left(d, t);           if newV3==0 then   newV1.j=0 /*ͺ*define the digits used for  VERIFY.  */
hdr=hdr newV3                                      /*ͺ*build (by appending)  display header.*/
low=low || bot.j;         high=high || top.j   /*ͺ*the low and high numbers for DO below*/
end   /*ͺ*j*/
/*ͺ* [β]  same as:   okD=left('0'd, t+1) */
/*ͺ*define the legal digits to be used.  */
okD=left(0 || d,  t + 1)                         /*ͺ*define the legal digits to be used.  */
say;   hdr=center(hdr" ",  60, 'β');     say hdr /*ͺ*display centered title for the output*/
say                                              /*ͺ*show a blank line  (as a separator). */
do g=low  to high                            /*ͺ* [β]  generate the ordered partitions*/
if verify(g, okD) \==0  then iterate         /*ͺ*filter out unwanted partitions (digs)*/
p=1                                          /*ͺ*P:  is the position of a decimal dig.*/
newV4=                                           /*ͺ*$:  will be the transformed numbers. */
do k=1  for newV2;   newV3=substr(g, p, len.k)    /*ͺ*verify the partitions numbers.       */
if verify(newV3, newV1.k) \==0  then iterate g    /*ͺ*is the decimal digit not valid ?     */
newV5=                                        /*ͺ* [β]  validate the decimal number.   */
if newV1.k\==0  then do j=1  for length(newV3);     z=substr(newV3, j, 1)        /*ͺ*get a dig.*/
if pos(z, newV4)\==0               then iterate g       /*ͺ*previous ?*/
newV5=newV5','z                                             /*ͺ*add comma.*/
if j==1                        then iterate         /*ͺ*is firstt?*/
if z<=substr(newV3, j-1, 1)        then iterate g       /*ͺ*ordered  ?*/
if pos(z, newV3, 1 +pos(z, newV3))\==0 then iterate g       /*ͺ*duplicate?*/
end   /*ͺ*j*/
p=p + len.k                               /*ͺ*point to the next decimal digit (num)*/
newV4=newV4 '  {'strip(translate(newV5, ,0), ,",")'}' /*ͺ*dress number up by suppessing LZ Β·Β·Β· */
end   /*ͺ*k*/
say center(newV4, length(hdr) )                  /*ͺ*display numbers in ordered partition.*/
end      /*ͺ*g*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ordered-partitions\ordered-partitions.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
