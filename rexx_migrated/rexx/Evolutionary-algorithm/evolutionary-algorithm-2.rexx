/*�*REXX program  demonstrates  an  evolutionary algorithm  (by using mutation).          */
parse arg  children  MR  seed .                  /*�*get optional arguments from the C.L. */
if children=='' | children=="," then children=10 /*�*# children produced each generation. */
if MR      =='' | MR      =="," then MR= "4%"    /*�*the character Mutation Rate each gen.*/
if right(MR,1)=='%'  then MR= strip(MR,,"%")/100 /*�*expressed as a percent?  Then adjust.*/
if seed\==''  then call random ,,seed            /*�*SEED allow the runs to be repeatable.*/
abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';        Labc= length(abc)

do i=0  for Labc;  newV1.i= substr(abc, i+1, 1)  /*�*define array  (for faster compare),  */
end   /*�*i*/                                  /*�*than picking one from a char string. */

target= 'METHINKS IT IS LIKE A WEASEL' ;    Ltar= length(target)

do j=1  for Ltar;  T.j= substr(target, j, 1) /*�*define an array (for faster compare),*/
end   /*�*j*/                                  /*�*faster than a byte-by-byte compare.  */

parent= mutate( left('', Ltar), 1)               /*�*gen rand string, same length as tar. */
say center('target string', Ltar, "─")    'children'       "mutationRate"
say target  center(children, 8)    center( (MR*100/1)'%', 12);                     say
say center('new string'   , Ltar, "─")     'closeness'      "generation"

do gen=0  until  parent==target;                      close= fitness(parent)
almost= parent
do  children;                       child= mutate(parent, MR)
newV2= fitness(child);                  if newV2<=close  then iterate
close= newV2;                           almost= child
say almost  right(close, 9)   right(gen, 10)
end   /*�*children*/
parent= almost
end   /*�*gen*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fitness: parse arg x; newV3=0;   do k=1  for Ltar;  newV3=newV3+(substr(x,k,1)==T.k);  end;   return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mutate:  parse arg x,rate                        /*�*set  X  to 1st argument, RATE to 2nd.*/
newV3=;       do m=1  for Ltar;       r=random(1, 100000)   /*�*REXX's max for RANDOM*/
if .00001*r<=rate  then do;    newV2= r//Labc;        newV3= newV3 || newV1.newV2;      end
else newV3= newV3  ||  substr(x, m, 1)
end   /*�*m*/
return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Evolutionary-algorithm\evolutionary-algorithm-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
