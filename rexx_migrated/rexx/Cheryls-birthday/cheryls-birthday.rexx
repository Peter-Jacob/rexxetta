/*�*REXX pgm finds Cheryl's birth date based on a person knowing the birth month, another */
/*�*──────────────────────── person knowing the birth day, given a list of possible dates.*/
newV3= 'May-15 May-16 May-19 June-17 June-18 July-14 July-16 August-14 August-15 August-17'
call delDays unique('day')
newV3= unique('day')
newV3= unique('month')
if words(newV3)==1  then say "Cheryl's birthday is"  translate(newV3, , '-')
else say "error in the program's logic."
exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
unique:  arg u 2, dups;  newV4= words(newV3);   newV1= newV3
do    j=newV4  to 2  by -1
if u=='D'     then parse value word(newV3, j)  with  '-'   x
else parse value word(newV3, j)  with   x   '-'
do k=1  for j-1
if u=='D'  then parse value word(newV3, k)  with  '-'   y
else parse value word(newV3, k)  with   y   '-'
if x==y    then dups= dups k j
end   /*�*k*/
end      /*�*j*/
do    d=newV4  for newV4  by -1
do p=1  for words(dups)  until newV5==d;  newV5= word(dups,p)
if newV5==d  then  newV1= delword(newV1, newV5, 1)
end   /*�*d*/
end      /*�*d*/
if words(newV1)==0  then return newV3
else return newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
delDays: parse arg days;  newV4= words(days)
do    j=newV4   for newV4   by -1;  parse value word(days, j) with x '-';  newV2= words(newV3)
do k=newV2  for newV2  by -1;  parse value word(newV3,    k) with y '-'
if x\==y  then iterate;  newV3= delword(newV3, k, 1)
end   /*�*k*/
end      /*�*j*/
return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cheryls-birthday\cheryls-birthday.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
