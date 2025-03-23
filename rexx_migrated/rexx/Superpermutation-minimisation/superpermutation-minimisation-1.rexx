/*�*REXX program attempts  to find better  minimizations  for computing superpermutations.*/
parse arg cycles .                               /*�*obtain optional arguments from the CL*/
if cycles=='' | cycles==","  then cycles= 7      /*�*Not specified?  Then use the default.*/

do n=0  to  cycles
newV4= 0;                           newV2.=        /*�*populate the first permutation.      */
do pop=1  for n;        newV3.pop= d2x(pop);        newV2.0= newV2.0  ||  newV3.pop
end  /*�*pop*/

do  while aPerm(n, 0)
if n\==0  then newV4= newV4+1;  newV2.newV4=
do j=1  for n;        newV2.newV4= newV2.newV4  ||  newV3.j
end   /*�*j*/
end     /*�*while*/
z= newV2.0
nm= n-1
do p=1  for newV4;      if newV2.j==''          then iterate
if pos(newV2.p, z)\==0  then iterate
parse  var   newV2.p    h  2  R  1  L  newV1
if  left(z, nm)==R  then do;    z= h  ||  z;    iterate;   end
if right(z,  1)==h  then do;    z= z  ||  R;    iterate;   end
z= z  ||  newV2.p
end   /*�*p*/                        /*�* [↑]  more IFs could be added for opt*/

L= commas( length(z) )
say 'length of superpermutation('n") ="      right(L, max(length(L), cycles+2) )
end   /*�*cycle*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV5;  do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
aPerm: procedure expose newV3.;    parse arg n,i;      nm= n - 1;      if n==0  then return 0
do k=nm  by -1  for nm; kp=k+1; if newV3.k<newV3.kp  then do; i=k; leave; end; end /*�*k*/
do j=i+1  while  j<n;  parse value  newV3.j newV3.n  with  newV3.n newV3.j;    n= n-1; end /*�*j*/
if i==0  then return 0
do m=i+1  while newV3.m<newV3.i; end /*�*m*/;    parse value  newV3.m  newV3.i   with   newV3.i  newV3.m
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Superpermutation-minimisation\superpermutation-minimisation-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
