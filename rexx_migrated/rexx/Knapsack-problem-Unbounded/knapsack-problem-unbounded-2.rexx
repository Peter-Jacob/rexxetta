/*�*REXX program solves the knapsack/unbounded problem: highest value, weight, and volume.*/

maxPanacea= 0
maxIchor  = 0;             /*�*   value                   weight                   volume */
maxGold   = 0;             /*�*  ═══════                  ══════                   ══════ */
max$      = 0;      panacea.$ = 3000  ;      panacea.w =  0.3 ;       panacea.v = 0.025
now.      = 0;        ichor.$ = 1800  ;        ichor.w =  0.2 ;         ichor.v = 0.015
newV1         = 0;         gold.$ = 2500  ;         gold.w =  2   ;          gold.v = 0.002
L         = 0;         sack.$ =    0  ;         sack.w = 25   ;          sack.v = 0.25

maxPanacea= min(sack.w / panacea.w,     sack.v / panacea.v)
maxIchor  = min(sack.w /   ichor.w,     sack.v /   ichor.v)
maxGold   = min(sack.w /    gold.w,     sack.v /    gold.v)

do     p=0  to maxPanacea
do   i=0  to maxIchor
do g=0  to maxGold
now.$ = g * gold.$     +     i * ichor.$     +     p * panacea.$
now.w = g * gold.w     +     i * ichor.w     +     p * panacea.w
now.v = g * gold.v     +     i * ichor.v     +     p * panacea.v
if now.w > sack.w  |  now.v  > sack.v  then iterate i
if now.$ > max$  then do;  newV1= 0;           max$= now.$;    end
if now.$ = max$  then do;  newV1= newV1 + 1;       maxP.newV1= p;      maxI.newV1= i;     maxG.newV1= g
max$.newV1= now.$;  maxW.newV1= now.w;  maxV.newV1= now.v
L= max(L, length(p + i + g) )
end
end  /*�*g  (gold)   */
end    /*�*i  (ichor)  */
end      /*�*p  (panacea)*/
L= L + 1
do j=1  for newV1;      say;      say copies('▒', 70)                "solution"  j
say '    panacea in sack:'    right(maxP.j, L)
say '     ichors in sack:'    right(maxI.j, L)
say ' gold items in sack:'    right(maxG.j, L)
say '════════════════════'    copies("═",   L)
say 'carrying a total of:'    right(maxP.j + maxI.j + maxG.j, L)
say left('', 40)     "total  value: "        max$.j / 1
say left('', 40)     "total weight: "        maxW.j / 1
say left('', 40)     "total volume: "        maxV.j / 1
end  /*�*j*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knapsack-problem-Unbounded\knapsack-problem-unbounded-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
