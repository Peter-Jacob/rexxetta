/*�*REXX program  demonstrates  an  evolutionary algorithm  (by using mutation).          */
parse arg  children  MR  seed .                  /*�*get optional arguments from the C.L. */
if children=='' | children=="," then children=10 /*�*# children produced each generation. */
if MR      =='' | MR      =="," then MR= "4%"    /*�*the character Mutation Rate each gen.*/
if right(MR,1)=='%'  then MR= strip(MR,,"%")/100 /*�*expressed as a percent?  Then adjust.*/
if seed\==''  then call random ,,seed            /*�*SEED allow the runs to be repeatable.*/
abc   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '  ;     Labc= length(abc)
target= 'METHINKS IT IS LIKE A WEASEL' ;     Ltar= length(target)
parent= mutate( left('', Ltar), 1)               /*�*gen rand string,same length as target*/
say center('target string', Ltar, "─")    'children'        "mutationRate"
say target  center(children, 8)   center((MR*100/1)'%', 12);                      say
say center('new string'    ,Ltar, "─")    "closeness"       'generation'

do gen=0  until  parent==target;                      close= fitness(parent)
almost= parent
do  children;                        child= mutate(parent,MR)
newV1= fitness(child);                   if newV1<=close  then iterate
close= newV1;                            almost= child
say almost  right(close, 9)   right(gen, 10)
end   /*�*children*/
parent= almost
end   /*�*gen*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fitness: parse arg x; newV2=0;  do k=1 for Ltar; newV2= newV2+(substr(x,k,1)==substr(target,k,1)); end
return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mutate:  parse arg x,rate;  newV2=                   /*�*set  X  to 1st argument, RATE to 2nd.*/
do j=1  for Ltar;       r= random(1, 100000)  /*�*REXX's max for RANDOM*/
if .00001*r<=rate  then newV2= newV2  ||  substr(abc, r//Labc+1, 1)
else newV2= newV2  ||  substr(x  , j        , 1)
end   /*�*j*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Evolutionary-algorithm\evolutionary-algorithm-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
