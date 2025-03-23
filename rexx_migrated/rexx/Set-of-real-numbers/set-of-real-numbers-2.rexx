/*�*REXX program  demonstrates  a way to  represent any set of real numbers  and  usage.  */
call quertySet 1, 3,  '[1,2)'
call quertySet ,   ,  '[0,2)   union   (1,3)'
call quertySet ,   ,  '[0,1)   union   (2,3]'
call quertySet ,   ,  '[0,2]   inter   (1,3)'
call quertySet ,   ,  '(1,2)     ∩     (2,3]'
call quertySet ,   ,  '[0,2)     \     (1,3)'
say;                                      say center(' start of required tasks ', 40, "═")
call quertySet ,   ,  '(0,1]   union   [0,2)'
call quertySet ,   ,  '[0,2)     ∩     (1,3)'
call quertySet ,   ,  '[0,3]     -     (0,1)'
call quertySet ,   ,  '[0,3]     -     [0,1]'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
badSet:    say;    say  '***error*** bad format of SET_def:  ('arg(1)")";         exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
emptySet:  parse arg newV3;               nam= valSet(newV3, 00);                   return newV2.3>newV2.4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isInSet:   parse arg newV4,x;             call valSet x
if \datatype(newV4, 'N')       then call setnewV3bad "number isn't not numeric:" newV4
if newV1.1=='(' &  newV4<=newV2.2) |,
newV1.1=='[' &  newV4< newV2.2) |,
newV1.4==')' &  newV4>=newV2.3) |,
newV1.4==']' &  newV4> newV2.3)    then return 0
return 1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
quertySet: parse arg lv,hv,s1 oop s2 .;  op=oop;   upper op;      cop=
if lv==''  then lv=0;      if hv==""  then hv= 2;      if op==''  then cop=  0
if wordpos(op, '| or UNION')                 \==0                 then cop= "|"
if wordpos(op, '& ∩ AND INTER INTERSECTION') \==0                 then cop= "&"
if wordpos(op, '\ - DIF DIFF DIFFERENCE')    \==0                 then cop= "\"
say
do i=lv  to hv;  b = isInSet(i, s1)
if cop\==0  then do
b2= isInSet(i, s2)
if cop=='&'  then b= b & b2
if cop=='|'  then b= b | b2
if cop=='\'  then b= b & \b2
end
express = s1 center(oop, max(5, length(oop) ) )    s2
say right(i, 5)    ' is in set'     express": "   word('no yes', b+1)
end   /*�*i*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
valSet:    parse arg q;              q=space(q, 0);    L= length(q);       newV2.0= ','
infinity = copies(9, digits() - 1)'e'copies(9, digits() - 1)0
if L<2                    then call setnewV3bad  'invalid expression'
newV2.4= right(q, 1)
parse var q  newV2.1  2  newV2.2  ','  newV2.3  newV1.4)
if newV2.1\=='(' & newV2.1\=="["  then call setnewV3bad  'left boundry'
if newV2.4\==')' & newV2.4\=="]"  then call setnewV3bad  'right boundry'
do j=2  to 3;    u=newV2.j;               upper u
if rightnewV1.j, 1)=='∞' | u="INFINITY"  then newV2.j= '-'infinity
if \datatypenewV1.j, 'N')  then call setnewV3bad  "value not numeric:"    newV2.j
end  /*�*j*/
if newV2.2>newV2.3  then parse var   L  .  newV2.0  newV2.2  newV2.3
return spacenewV1.1 newV2.2 newV2.0 newV2.3 newV2.4,  0)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Set-of-real-numbers\set-of-real-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
