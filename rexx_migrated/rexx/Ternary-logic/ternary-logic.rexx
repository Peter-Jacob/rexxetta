/*ͺ*REXX program displays a ternary truth table  [true, false, maybe]   for the variables */
/*ͺ*ββββ and one or more expressions.                                                     */
/*ͺ*ββββ Infix notation is supported with one character propositional constants.          */
/*ͺ*ββββ Variables (propositional constants) allowed:    A βββΊ Z,     a βββΊ z   except  u.*/
/*ͺ*ββββ All propositional constants are case insensative  (except lowercase  v).         */
parse arg newV1                               /*ͺ*obtain optional argument from the CL.*/
if newV1\=''  then do                         /*ͺ*Got one?  Then show user's expression*/
call truthTable newV1   /*ͺ*display the user's truth tableβββΊterm*/
exit                       /*ͺ*we're all done with the truth table. */
end

call truthTable  "a & b ; AND"
call truthTable  "a | b ; OR"
call truthTable  "a ^ b ; XOR"
call truthTable  "a ! b ; NOR"
call truthTable  "a ΒξεχΦ±± b ; NAND"
call truthTable  "a xnor b ; XNOR"               /*ͺ*XNOR  is the same as  NXOR.          */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
truthTable: procedure; parse arg newV8 ';' comm 1 newV5;        newV5=strip(newV5)
newV8=translate(strip(newV8), '|', "v");                   newV6=newV8;        upper newV6
newV6=translate(newV6, '()()()', "[]{}Β«Β»");              newV4.=0;       PCs=;        hdrPCs=
newV3= 'abcdefghijklmnopqrstuvwxyz';                newV2=newV3;  upper newV2
newV9= 'ff'x                                         /*ͺ*βββββββββinfix operatorsβββββββ*/
op.=                                             /*ͺ*a single quote (') wasn't      */
/*ͺ*     implemented for negation. */
op.0  = 'false  boolFALSE'                       /*ͺ*unconditionally  FALSE         */
op.1  = 'and    and & *'                         /*ͺ* AND, conjunction              */
op.2  = 'naimpb NaIMPb'                          /*ͺ*not A implies B                */
op.3  = 'boolb  boolB'                           /*ͺ*B  (value of)                  */
op.4  = 'nbimpa NbIMPa'                          /*ͺ*not B implies A                */
op.5  = 'boola  boolA'                           /*ͺ*A  (value of)                  */
op.6  = 'xor    xor && % ^'                      /*ͺ* XOR, exclusive OR             */
op.7  = 'or     or | + v'                        /*ͺ*  OR, disjunction              */
op.8  = 'nor    nor ! β'                         /*ͺ* NOR, not OR, Pierce operator  */
op.9  = 'xnor   xnor nxor'                       /*ͺ*NXOR, not exclusive OR, not XOR*/
op.10 = 'notb   notB'                            /*ͺ*not B (value of)               */
op.11 = 'bimpa  bIMPa'                           /*ͺ*    B implies A                */
op.12 = 'nota   notA'                            /*ͺ*not A (value of)               */
op.13 = 'aimpb  aIMPb'                           /*ͺ*    A implies B                */
op.14 = 'nand   nand ΒξεχΦ±± β'                        /*ͺ*NAND, not AND, Sheffer operator*/
op.15 = 'true   boolTRUE'                        /*ͺ*unconditionally   TRUE         */
/*ͺ*alphabetic names need changing.*/
op.16 = '\   NOT ~ β . Β¬'                        /*ͺ* NOT, negation                 */
op.17 = '>   GT'                                 /*ͺ*conditional greater than       */
op.18 = '>=  GE β> => ββ> ==>' "1a"x             /*ͺ*conditional greater than or eq.*/
op.19 = '<   LT'                                 /*ͺ*conditional less than          */
op.20 = '<=  LE <β <= <ββ <=='                   /*ͺ*conditional less then or equal */
op.21 = '\=  NE ~= β= .= Β¬='                     /*ͺ*conditional not equal to       */
op.22 = '=   EQ EQUAL EQUALS =' "1b"x            /*ͺ*biconditional  (equals)        */
op.23 = '0   boolTRUE'                           /*ͺ*TRUEness                       */
op.24 = '1   boolFALSE'                          /*ͺ*FALSEness                      */

op.25 = 'NOT NOT NEG'                            /*ͺ*not, neg  (negative)           */

do jj=0  while  op.jj\=='' | jj<16             /*ͺ*change opersβββΊwhat REXX likes.*/
new=word(op.jj,1)
do kk=2  to words(op.jj)                     /*ͺ*handle each token separately.  */
newV10=word(op.jj, kk);     upper newV10
if wordpos(newV10, newV6)==0   then iterate          /*ͺ*no such animal in this string. */
if datatype(new, 'm')  then newnewV11=newV9           /*ͺ*expresion needs transcribing.  */
else newnewV11=new
newV6=changestr(newV10, newV6, newnewV11)                    /*ͺ*transcribe the function (maybe)*/
if newnewV11==newV9  then newV6=changeFunc(newV6, newV9, new)   /*ͺ*use the internal boolean name. */
end   /*ͺ*kk*/
end     /*ͺ*jj*/

newV6=translate(newV6, '()', "{}")                     /*ͺ*finish cleaning up transcribing*/
do jj=1  for length(newV2)                 /*ͺ*see what variables are used.   */
newV10=substr(newV2, jj, 1)                     /*ͺ*use available upercase alphabet*/
if pos(newV10,newV6)==0  then iterate              /*ͺ*found one?   No, keep looking. */
newV4.jj=2                                    /*ͺ*found:  set upper bound for it.*/
PCs=PCs newV10                                  /*ͺ*also, add to propositional cons*/
hdrPCs=hdrPCS  center(newV10, length('false'))  /*ͺ*build a propositional cons hdr.*/
end   /*ͺ*jj*/
newV6=PCs  '('newV6")"                                 /*ͺ*sep prop. cons. from expression*/
ptr='_βββββΊ_'                                    /*ͺ*a pointer for the truth table. */
hdrPCs=substr(hdrPCs,2)                          /*ͺ*create a header for prop. cons.*/
say hdrPCs left('', length(ptr) -1)   newV5         /*ͺ*show prop cons hdr +expression.*/
say copies('βββββ ', words(PCs))   left('', length(ptr)-2)   copies('β', length(newV5))
/*ͺ*Note: "true"s:  rightβjustified*/
do a=0  to newV4.1
do b=0  to newV4.2
do c=0  to newV4.3
do d=0  to newV4.4
do e=0  to newV4.5
do f=0  to newV4.6
do g=0  to newV4.7
do h=0  to newV4.8
do i=0  to newV4.9
do j=0  to newV4.10
do k=0  to newV4.11
do l=0  to newV4.12
do m=0  to newV4.13
do n=0  to newV4.14
do o=0  to newV4.15
do p=0  to newV4.16
do q=0  to newV4.17
do r=0  to newV4.18
do s=0  to newV4.19
do t=0  to newV4.20
do u=0  to newV4.21
do newV11=0  to newV4.22
do w=0  to newV4.23
do x=0  to newV4.24
do y=0  to newV4.25
do z=0  to newV4.26
interpret '_=' newV6             /*ͺ*evaluate truth T.*/
newV10=changestr(0, newV10, 'false')    /*ͺ*convert 0βββΊfalse*/
newV10=changestr(1, newV10, '_true')    /*ͺ*convert 1βββΊ_true*/
newV10=changestr(2, newV10, 'maybe')    /*ͺ*convert 2βββΊmaybe*/
newV10=insert(ptr, newV10, wordindex(newV10, words(newV10)) -1) /*ͺ*βββΊ*/
say translate(newV10, , '_')       /*ͺ*display truth tab*/
end   /*ͺ*z*/
end    /*ͺ*y*/
end     /*ͺ*x*/
end      /*ͺ*w*/
end       /*ͺ*v*/
end        /*ͺ*u*/
end         /*ͺ*t*/
end          /*ͺ*s*/
end           /*ͺ*r*/
end            /*ͺ*q*/
end             /*ͺ*p*/
end              /*ͺ*o*/
end               /*ͺ*n*/
end                /*ͺ*m*/
end                 /*ͺ*l*/
end                  /*ͺ*k*/
end                   /*ͺ*j*/
end                    /*ͺ*i*/
end                     /*ͺ*h*/
end                      /*ͺ*g*/
end                       /*ͺ*f*/
end                        /*ͺ*e*/
end                         /*ͺ*d*/
end                          /*ͺ*c*/
end                           /*ͺ*b*/
end                            /*ͺ*a*/
say
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
scan: procedure; parse arg x,at;    L=length(x);    t=L;     lp=0;     apost=0;    quote=0
if at<0  then do;   t=1;   x= translate(x, '()', ")(");    end

do j=abs(at)  to t  by sign(at);  newV10=substr(x,j,1);  newV7=substr(x,j,2)
if quote           then do; if newV10\=='"'  then iterate
if newV7=='""'     then do; j=j+1; iterate; end
quote=0;  iterate
end
if apost           then do; if newV10\=="'"  then iterate
if newV7=="''"     then do; j=j+1; iterate; end
apost=0;  iterate
end
if newV10=='"'          then do;  quote=1;                   iterate; end
if newV10=="'"          then do;  apost=1;                   iterate; end
if newV10==' '          then iterate
if newV10=='('          then do;  lp=lp+1;                   iterate; end
if lp\==0          then do;  if newV10==')'  then lp=lp-1;   iterate; end
if datatype(newV10,'U') then return j - (at<0)
if at<0            then return j + 1
end   /*ͺ*j*/
return min(j,L)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
changeFunc: procedure;  parse arg z,fC,newF;       funcPos= 0
do forever
funcPos= pos(fC, z, funcPos + 1);      if funcPos==0  then return z
origPos= funcPos
z= changestr(fC, z, ",'"newF"',")
funcPos= funcPos + length(newF) + 4
where= scan(z, funcPos)     ;        z= insert(    '}',  z,  where)
where= scan(z, 1 - origPos) ;        z= insert('trit{',  z,  where)
end   /*ͺ*forever*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
trit: procedure; arg a,newV8,b;   v= \(a==2 | b==2);    o= (a==1 | b==1);     z= (a==0 | b==0)
select
when newV8=='FALSE'   then            return 0
when newV8=='AND'     then if v  then return a & b;      else return 2
when newV8=='NAIMPB'  then if v  then return \(\a & \b); else return 2
when newV8=='BOOLB'   then            return b
when newV8=='NBIMPA'  then if v  then return \(\b & \a); else return 2
when newV8=='BOOLA'   then            return a
when newV8=='XOR'     then if v  then return a && b    ; else return 2
when newV8=='OR'      then if v  then return a | b     ; else  if o  then return 1
else return 2
when newV8=='NOR'     then if v  then return \(a | b)  ; else return 2
when newV8=='XNOR'    then if v  then return \(a && b) ; else return 2
when newV8=='NOTB'    then if v  then return \b        ; else return 2
when newV8=='NOTA'    then if v  then return \a        ; else return 2
when newV8=='AIMPB'   then if v  then return \(a & \b) ; else return 2
when newV8=='NAND'    then if v  then return \(a &  b) ; else  if z  then return 1
else return 2
when newV8=='TRUE'    then           return   1
otherwise                        return -13       /*ͺ*error, unknown function.*/
end   /*ͺ*select*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ternary-logic\ternary-logic.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
