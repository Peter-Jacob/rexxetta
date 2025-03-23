//*�*REXX program displays the  ordered partitions  as:   orderedPartitions(i, j, k, ···). */
call orderedPartitions  2,0,2                    /*�*Note:      2,,2      will also work. */
call orderedPartitions  1,1,1
call orderedPartitions  1,2,0,1                  /*�*Note:      1,2,,1    will also work. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
orderedPartitions: procedure;  newV2=arg();   bot.=;   top.=;   low=;    high=;    d=123456789
t=0                                              /*�*T:   is the sum of all the arguments.*/
do i=1  for newV2;       t=t + arg(i)      /*�*sum all the highest numbers in parts.*/
end   /*�*i*/                            /*�* [↑]  may have an omitted argument.  */
hdr= ' partitions for: '                         /*�*define the start of the header text. */
do j=1  for newV2;               newV3= arg(j)         /*�*  _:  is the    Jth   argument.      */
len.j=max(1, newV3)                                /*�*LEN:  length of args.  «0 is special»*/
bot.j=left(d, newV3);         if newV3==0 then bot.j=0 /*�*define the  bottom  number for range.*/
top.j=right(left(d,t),newV3); if newV3==0 then top.j=0 /*�*  "     "     top      "    "    "   */
newV1.j=left(d, t);           if newV3==0 then   newV1.j=0 /*�*define the digits used for  VERIFY.  */
hdr=hdr newV3                                      /*�*build (by appending)  display header.*/
low=low || bot.j;         high=high || top.j   /*�*the low and high numbers for DO below*/
end   /*�*j*/
/*�* [↓]  same as:   okD=left('0'd, t+1) */
/*�*define the legal digits to be used.  */
okD=left(0 || d,  t + 1)                         /*�*define the legal digits to be used.  */
say;   hdr=center(hdr" ",  60, '═');     say hdr /*�*display centered title for the output*/
say                                              /*�*show a blank line  (as a separator). */
do g=low  to high                            /*�* [↑]  generate the ordered partitions*/
if verify(g, okD) \==0  then iterate         /*�*filter out unwanted partitions (digs)*/
p=1                                          /*�*P:  is the position of a decimal dig.*/
newV4=                                           /*�*$:  will be the transformed numbers. */
do k=1  for newV2;   newV3=substr(g, p, len.k)    /*�*verify the partitions numbers.       */
if verify(newV3, newV1.k) \==0  then iterate g    /*�*is the decimal digit not valid ?     */
newV5=                                        /*�* [↓]  validate the decimal number.   */
if newV1.k\==0  then do j=1  for length(newV3);     z=substr(newV3, j, 1)        /*�*get a dig.*/
if pos(z, newV4)\==0               then iterate g       /*�*previous ?*/
newV5=newV5','z                                             /*�*add comma.*/
if j==1                        then iterate         /*�*is firstt?*/
if z<=substr(newV3, j-1, 1)        then iterate g       /*�*ordered  ?*/
if pos(z, newV3, 1 +pos(z, newV3))\==0 then iterate g       /*�*duplicate?*/
end   /*�*j*/
p=p + len.k                               /*�*point to the next decimal digit (num)*/
newV4=newV4 '  {'strip(translate(newV5, ,0), ,",")'}' /*�*dress number up by suppessing LZ ··· */
end   /*�*k*/
say center(newV4, length(hdr) )                  /*�*display numbers in ordered partition.*/
end      /*�*g*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ordered-partitions\ordered-partitions.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
