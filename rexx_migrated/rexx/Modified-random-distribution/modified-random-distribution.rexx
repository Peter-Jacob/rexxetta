/*�*REXX program generates a "<" shaped probability of number generation using a modifier.*/
parse arg randn bins seed .                      /*�*obtain optional argument from the CL.*/
if randN=='' | randN==","  then randN= 100000    /*�*Not specified?  Then use the default.*/
if  bins=='' |  bins==","  then  bins=     20    /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')   then call random ,,seed /*�* "      "         "   "   "     "    */
call MRD
newV1.= 0
do j=1  for randN;   bin= newV2.j*bins%1
newV1.bin= newV1.bin + 1                           /*�*bump the applicable bin counter.     */
end   /*�*j*/
mx= 0
do k=1  for randN;   mx= max(mx, newV1.k)      /*�*find the maximum, used for histograph*/
end   /*�*k*/

say '  bin'
say '────── '   center('(with '    commas(randN)    " samples",  80 - 10)

do b=0  for bins;  say format(b/bins,2,2)   copies('■', 70*newV1.b%mx)" "   commas(newV1.b)
end   /*�*b*/
exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:   arg newV3;  do jc=length(newV3)-3  to 1  by -3;  newV3=insert(',', newV3, jc);  end;    return newV3
rand:     return random(0, 100000) / 100000
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
modifier: parse arg y;   if y<.5  then return  2 * (.5 -  y)
else return  2 * ( y - .5)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
MRD:      newV4=0;                      newV2.=          /*�*MRD:  Modified Random distribution.  */
do until newV4==randN;      r= rand()    /*�*generate a random number; assign bkup*/
if rand()>=modifier(r)  then iterate /*�*Doesn't meet requirement?  Then skip.*/
newV4= newV4 + 1;               newV2.newV4= r       /*�*bump counter; assign the MRD to array*/
end   /*�*until*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Modified-random-distribution\modified-random-distribution.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
