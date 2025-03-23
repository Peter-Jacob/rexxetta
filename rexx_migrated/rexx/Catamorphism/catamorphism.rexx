/*�*REXX program demonstrates a  method  for  catamorphism  for some simple functions.    */
newV1= 1 2 3 4 5 6 7 8 9 10
say 'list:'     fold(newV1,  "list")
say ' sum:'     fold(newV1,  "+"   )
say 'prod:'     fold(newV1,  "*"   )
say ' cat:'     fold(newV1,  "||"  )
say ' min:'     fold(newV1,  "min" )
say ' max:'     fold(newV1,  "max" )
say ' avg:'     fold(newV1,  "avg" )
say ' GCD:'     fold(newV1,  "GCD" )
say ' LCM:'     fold(newV1,  "LCM" )
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fold: procedure;  parse arg z;  arg ,f;         z = space(z);      BIFs= 'MIN MAX LCM GCD'
za= translate(z, f, ' ');                 zf= f"("translate(z, ',' , " ")')'
if f== '+' | f=="*"       then interpret  "return"  za
if f== '||'               then return  space(z, 0)
if f== 'AVG'              then interpret  "return"  fold(z, '+')    "/"    words(z)
if wordpos(f, BIFs)\==0   then interpret  "return"  zf
if f=='LIST' | f=="SHOW"  then return z
return 'illegal function:'     arg(2)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
GCD:  procedure;  newV2=;                          do j=1  for arg();    newV2= newV2 arg(j)
end   /*�*j*/
parse var newV2 x z .;    if x=0  then x= z                  /*�* [↑] build an arg list.*/
x= abs(x)
do k=2  to words(newV2);  y= abs( word(newV2, k));   if y=0  then iterate
do until newV3=0;       newV3= x // y;      x= y;     y= newV3
end   /*�*until*/
end   /*�*k*/
return x
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LCM:  procedure;  newV2=;    do j=1  for arg();     newV2= newV2 arg(j)
end   /*�*j*/
x= abs(word(newV2, 1))                                       /*�* [↑] build an arg list.*/
do k=2  to words(newV2);   newV4= abs(word(newV2, k));  if newV4=0  then return 0
x= x*newV4  /  GCD(x, newV4)                  /*�*GCD does the heavy work*/
end   /*�*k*/
return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Catamorphism\catamorphism.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
