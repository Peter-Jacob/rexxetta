/*�*REXX program attempts  to find better  minimizations  for computing superpermutations.*/
parse arg cycles .                               /*�*obtain optional arguments from the CL*/
if cycles=='' | cycles==","  then cycles= 7      /*�*Not specified?  Then use the default.*/

do n=0  to  cycles
newV3= 0;                          newV1.=         /*�*populate the first permutation.      */
do pop=1  for n;       newV2.pop= d2x(pop);         newV1.0= newV1.0  ||  newV2.pop
end     /*�*pop*/

do  while aPerm(n,0);  if n\==0  then newV3= newV3+1;   newV1.newV3=
do j=1  for n;      newV1.newV3= newV1.newV3  ||  newV2.j
end  /*�*j*/
end     /*�*while*/
z= newV1.0
c= 0                     /*�*count of found permutations (so far).*/
do j=1  while c\==newV3
if j>newV3  then do;  c= c + 1             /*�*exhausted finds and shortcuts; concat*/
z= z  ||  newV1.j;  newV1.j=
j= 1
end
if newV1.j==''          then iterate       /*�*Already found? Then ignore this perm.*/
if pos(newV1.j, z)\==0  then do;  c= c + 1;      newV1.j=
iterate
end

do k=n-1  to 1  by -1              /*�*handle the shortcuts in perm finding.*/
if substr(newV1.j, k)==left(z, k)  then do;  c= c+1  /*�*found rightish shortcut*/
z= left(newV1.j, k-1)  ||  z;     newV1.j=
iterate j
end
if left(newV1.j, k) ==right(z, k)  then do;  c= c+1 /*�*found   leftish shortcut*/
z= z  ||  substr(newV1.j, k+1);   newV1.j=
iterate j
end
end   /*�*k*/                        /*�* [↑]  more IFs could be added for opt*/
end      /*�*j*/

L= commas( length(z) )
say 'length of superpermutation('n") ="     right(L, max(length(L), cycles+2) )
end   /*�*n*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
aPerm: procedure expose newV2.;     parse arg n,i;    nm=n-1;  if n==0  then return 0
do k=nm  by -1  for nm; kp=k+1; if newV2.k<newV2.kp  then do; i=k;leave; end; end /*�*k*/
do j=i+1  while  j<n;  parse value  newV2.j newV2.n  with  newV2.n newV2.j;    n=n-1; end /*�*j*/
if i==0  then return 0
do m=i+1  while newV2.m<newV2.i; end /*�*m*/;   parse value  newV2.m newV2.i  with  newV2.i newV2.m
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Superpermutation-minimisation\superpermutation-minimisation-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
