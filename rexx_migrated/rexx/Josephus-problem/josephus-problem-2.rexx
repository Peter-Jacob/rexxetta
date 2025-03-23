/*�*REXX program solves  Josephus problem:   N  men standing in a circle,  every Kth kilt.*/
parse arg N K Z R .                              /*�*obtain optional arguments from the CL*/
if N=='' | N==","   then  N= 41                  /*�*    men  not specified?  Use default.*/
if K=='' | K==","   then  K=  3                  /*�*   kilt   "      "        "     "    */
if Z=='' | Z==","   then  Z=  0                  /*�*  start   "      "        "     "    */
if R=='' | R==","   then  R=  1                  /*�*remaining "      "        "     "    */
newV1=;       do i=Z  for N;  newV1= newV1 i;  end  /*�*i*/    /*�*populate prisoner's circle (with a #)*/
x=                                               /*�*the list of prisoners to be removed. */
do c=k  by k;         p= words(newV1)          /*�*keep removing until  R  are remaining*/
if c>p then do                             /*�*   [↓] remove (kill) some prisoner(s)*/
do j=1  for words(x);      newV1= delword(newV1, word(x, j) + 1 - j,   1)
if words(newV1)==R  then leave c /*�*The slaying finished? (R people left)*/
end   /*�*j*/
c= (c//p) // words(newV1);   x=    /*�*adjust prisoner count-off and circle.*/
end
if c\==0  then x=x c                       /*�*the list of prisoners to be removed. */
end   /*�*c*/                                /*�*remove 'til   R   prisoners are left.*/

say 'removing every '   th(K)   " prisoner out of "    N    ' (starting at'   Z")  with ",
R    ' survivor's(R)",  leaving prisoner"s(R)':'   newV1
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:  if arg(1)==1  then return arg(3);            return word( arg(2) 's', 1)   /*�*plurals*/
th: y= arg(1);   return y || word('th st nd rd', 1+ y // 10 * (y//100%10\==1) * (y//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Josephus-problem\josephus-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
