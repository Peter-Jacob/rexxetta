/*ͺ*REXX program displays a truth table of  variables and an expression.   Infix notation */
/*ͺ*βββββββββββββββ is supported with one character propositional constants;  variables   */
/*ͺ*βββββββββββββββ (propositional constants) that are allowed:  AβββΊZ,  aβββΊz   except u.*/
/*ͺ*βββββββββββββββ All propositional constants are case insensitive (except lowercase u).*/

parse arg userText                               /*ͺ*get optional expression from the CL. */
if userText\=''  then do                         /*ͺ*Got one?   Then show user's stuff.   */
call truthTable userText   /*ͺ*display truth table for the userText.*/
exit                       /*ͺ*we're finished with the user's text. */
end

call truthTable  "G ^ H ; XOR"                   /*ͺ*text after ; is echoed to the output.*/
call truthTable  "i | j ; OR"
call truthTable  "G nxor H ; NXOR"
call truthTable  "k ! t ; NOR"
call truthTable  "p & q ; AND"
call truthTable  "e ΒξεχΦ±° f ; NAND"
call truthTable  "S | (T ^ U)"
call truthTable  "(p=>q) v (q=>r)"
call truthTable  "A ^ (B ^ (C ^ D))"
exit                                             /*ͺ*quit while we're ahead,  by golly.   */

/*ͺ* βββ no way, Jose. βββ */                  /*ͺ* [β]  shows a 32,768 line truth table*/
call truthTable  "A^ (B^ (C^ (D^ (E^ (F^ (G^ (H^ (I^ (J^ (L^ (L^ (M^ (N^O)  ))))))))))))"
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
truthTable: procedure; parse arg newV7 ';' comm 1 newV4;        newV4=  strip(newV4);      hdrPCs=
newV7= translate(strip(newV7), '|', "v");         newV5=  newV7;              upper newV5
newV5= translate(newV5, '()()()', "[]{}Β«Β»");     newV3.= 0;              PCs=
newV2= 'abcdefghijklmnopqrstuvwxyz';          newV1= newV2;         upper newV1

/*ͺ* βββββββββββββββββββββββ¦βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β                     β                  bool(bitsA, bitsB, BF)                    β
β                     ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ’
β                     β performs the boolean function  BF    ββββββββ¬ββββββββββ    β
β                     β      on the   A   bitstring          β  BF  β common  β    β
β                     β    with the   B   bitstring.         β valueβ  name   β    β
β                     β                                      ββββββββΌββββββββββξεχΦ·    β
β                     β BF   must be a  one to four bit      β 0000 βboolfalseβ    β
β                     β value  (from  0000 βββΊ 1111),        β 0001 β and     β    β
β  This boxed table   β leading zeroes can be omitted.       β 0010 β NaIMPb  β    β
β was reβconstructed  β                                      β 0011 β boolB   β    β
β   from an old IBM   β BF   may have multiple values (one   β 0100 β NbIMPa  β    β
β    publicastion:    β for each pair of bitstrings):        β 0101 β boolA   β    β
β                     β                                      β 0110 β xor     β    β
β   "PL/I Language    β  ββββββββ¬βββββββ¬ββββββββββββββββ     β 0111 β or      β    β
β   Specifications"   β  β Abit β Bbit β   returns     β     β 1000 β nor     β    β
β                     β  ββββββββΌβββββββΌββββββββββββββββξεχΦ·     β 1001 β nxor    β    β
β                     β  β   0  β   0  β 1st bit in BF β     β 1010 β notB    β    β
β                     β  β   0  β   1  β 2nd bit in BF β     β 1011 β bIMPa   β    β
β   βββ March 1969.   β  β   1  β   0  β 3rd bit in BF β     β 1100 β notA    β    β
β                     β  β   1  β   1  β 4th bit in BF β     β 1101 β aIMPb   β    β
β                     β  ββββββββ΄βββββββ΄ββββββββββββββββ     β 1110 β nand    β    β
β                     β                                      β 1111 βbooltrue β    β
β                     β                                   ββββ΄βββββββ΄ββββββββββξεχΦ·    β
β                     β                                   β A  0101           β    β
β                     β                                   β B  0011           β    β
β                     β                                   βββββββββββββββββββββ    β
βββββββββββββββββββββββ©βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ */

newV8= 'ff'x                                       /*ͺ* [β]  βββββ infix operators (0βββΊ15) */
op.=                                           /*ͺ*Note:   a  single quote  (')  wasn't */
/*ͺ*            implemented for negation.*/
op.0 = 'false  boolFALSE'                      /*ͺ*unconditionally  FALSE               */
op.1 = '&      and *'                          /*ͺ* AND,  conjunction                   */
op.2 = 'naimpb NaIMPb'                         /*ͺ*not A implies B                      */
op.3 = 'boolb  boolB'                          /*ͺ*B  (value of)                        */
op.4 = 'nbimpa NbIMPa'                         /*ͺ*not B implies A                      */
op.5 = 'boola  boolA'                          /*ͺ*A  (value of)                        */
op.6 = '&&     xor % ^'                        /*ͺ* XOR,  exclusive OR                  */
op.7 = '|      or + v'                         /*ͺ*  OR,  disjunction                   */
op.8 = 'nor    nor ! β'                        /*ͺ* NOR,  not OR,  Pierce operator      */
op.9 = 'xnor   xnor nxor'                      /*ͺ*NXOR,  not exclusive OR,  not XOR    */
op.10= 'notb   notB'                           /*ͺ*not B  (value of)                    */
op.11= 'bimpa  bIMPa'                          /*ͺ*    B  implies A                     */
op.12= 'nota   notA'                           /*ͺ*not A  (value of)                    */
op.13= 'aimpb  aIMPb'                          /*ͺ*    A  implies B                     */
op.14= 'nand   nand ΒξεχΦ±° β'                       /*ͺ*NAND,  not AND,  Sheffer operator    */
op.15= 'true   boolTRUE'                       /*ͺ*unconditionally   TRUE               */
/*ͺ*alphabetic names that need changing. */
op.16= '\   NOT ~ β . Β¬'                       /*ͺ* NOT,  negation                      */
op.17= '>   GT'                                /*ͺ*conditional                          */
op.18= '>=  GE β> => ββ> ==>'   "1a"x          /*ͺ*conditional;     (see note below.)βββ*/
op.19= '<   LT'                                /*ͺ*conditional                         β*/
op.20= '<=  LE <β <= <ββ <=='                  /*ͺ*conditional                         β*/
op.21= '\=  NE ~= β= .= Β¬='                    /*ͺ*conditional                         β*/
op.22= '=   EQ EQUAL EQUALS ='  "1b"x          /*ͺ*biβconditional;  (see note below.)β β*/
op.23= '0   boolTRUE'                          /*ͺ*TRUEness                          β β*/
op.24= '1   boolFALSE'                         /*ͺ*FALSEness                         β β*/
/*ͺ* [β] glphys  '1a'x  and  "1b"x  can't*/
/*ͺ*     displayed under most DOS' & such*/
do jj=0  while  op.jj\=='' | jj<16           /*ͺ*change opers βββΊ into what REXX likes*/
new= word(op.jj, 1)                          /*ͺ*obtain the 1st token of  infex table.*/
/*ͺ* [β]  process the rest of the tokens.*/
do kk=2  to words(op.jj)                   /*ͺ*handle each of the tokens separately.*/
newV9=word(op.jj, kk);          upper newV9        /*ͺ*obtain another token from infix table*/
if wordpos(newV9, newV5)==0   then iterate        /*ͺ*no such animal in this string.       */
if datatype(new, 'm')  then newnewV10= newV8        /*ͺ*it            needs to be transcribed*/
else newnewV10= new      /*ͺ*it  doesn't   need   "  "     "      */
newV5= changestr(newV9, newV5, newnewV10)                 /*ͺ*transcribe the function (maybe).     */
if newnewV10==newV8  then newV5= changeFunc(newV5,newV8,new)  /*ͺ*use the internal boolean name.       */
end   /*ͺ*kk*/
end     /*ͺ*jj*/

newV5=translate(newV5, '()', "{}")                   /*ͺ*finish cleaning up the transcribing. */

do jj=1  for length(newV1)               /*ͺ*see what variables are being used.   */
newV9= substr(newV1, jj, 1)                  /*ͺ*use the available upercase aLphabet. */
if pos(newV9,newV5) == 0  then iterate          /*ͺ*Found one?    No, then keep looking. */
newV3.jj= 1                                 /*ͺ*found:  set upper bound for it.      */
PCs= PCs newV9                             /*ͺ*also, add to propositional constants.*/
hdrPCs=hdrPCS center(newV9,length('false'))  /*ͺ*build a PC header for transcribing.  */
end   /*ͺ*jj*/

ptr= '_βββββΊ_'                                 /*ͺ*a (text) pointer for the truth table.*/
newV5= PCs '('newV5")"                              /*ͺ*separate the  PCs  from expression.  */
hdrPCs= substr(hdrPCs, 2)                      /*ͺ*create a header for the  PCs.        */
say hdrPCs left('', length(ptr) - 1)   newV4      /*ͺ*display  PC  header and expression.  */
say copies('βββββ ', words(PCs))    left('', length(ptr) -2)  copies('β', length(newV4))
/*ͺ*Note:  "true"s:  are rightβjustified.*/
do a=0  to newV3.1
do b=0  to newV3.2
do c=0  to newV3.3
do d=0  to newV3.4
do e=0  to newV3.5
do f=0  to newV3.6
do g=0  to newV3.7
do h=0  to newV3.8
do i=0  to newV3.9
do j=0  to newV3.10
do k=0  to newV3.11
do l=0  to newV3.12
do m=0  to newV3.13
do n=0  to newV3.14
do o=0  to newV3.15
do p=0  to newV3.16
do q=0  to newV3.17
do r=0  to newV3.18
do s=0  to newV3.19
do t=0  to newV3.20
do u=0  to newV3.21
do newV10=0  to newV3.22
do w=0  to newV3.23
do x=0  to newV3.24
do y=0  to newV3.25
do z=0  to newV3.26;         interpret   '_='   newV5
/*ͺ*evaluate truth T.*/
newV9= changestr(1, newV9, '_true') /*ͺ*convert 1βββΊ_true*/
newV9= changestr(0, newV9, 'false') /*ͺ*convert 0βββΊfalse*/
newV9= insert(ptr,  newV9, wordindex(newV9, words(newV9) )  - 1)
say translate(newV9, , '_')     /*ͺ*display truth tab*/
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
say;  say
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
scan: procedure; parse arg x,at;      L= length(x);   t=L;    Lp=0;    apost=0;    quote=0
if at<0  then      do;   t=1;   x= translate(x, '()', ")(")
end                      /*ͺ* [β]  get 1 or 2 chars at location J*/

do j=abs(at)  to t  by sign(at);      newV9=substr(x, j ,1);   newV6=substr(x, j, 2)
if quote             then do;  if newV9\=='"'    then iterate
if newV6=='""'   then do;  j= j+1;  iterate;  end
quote=0;  iterate
end
if apost             then do;  if newV9\=="'"    then iterate
if newV6=="''"   then do;  j= j+1;  iterate;  end
apost=0;   iterate
end
if newV9== '"'           then do;  quote=1;   iterate;  end
if newV9== "'"           then do;  apost=1;   iterate;  end
if newV9== ' '           then iterate
if newV9== '('           then do;  Lp= Lp+1;  iterate;  end
if Lp\==0            then do;  if newV9==')'     then Lp= Lp-1;     iterate;  end
if datatype(newV9, 'U')  then return j - (at<0)
if at<0              then return j + 1              /*ͺ*is   _    uppercase ? */
end   /*ͺ*j*/

return min(j, L)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
changeFunc: procedure;  parse arg z, fC, newF ;           funcPos= 0

do forever
funcPos= pos(fC, z, funcPos + 1);           if funcPos==0  then return z
origPos= funcPos
z= changestr(fC, z, ",'"newF"',") /*ͺ*arg 3 βξεχΦ±°  ",'" || newF || "-',"  */
funcPos= funcPos + length(newF) + 4
where= scan(z, funcPos)       ;           z= insert(    '}',  z,  where)
where= scan(z, 1 - origPos)   ;           z= insert('bool{',  z,  where)
end   /*ͺ*forever*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bool: procedure; arg a,?,b                              /*ͺ* ββββ ARG uppercases all args.*/

select                        /*ͺ*SELECT chooses which function.*/
/*ͺ*0*/    when ? == 'FALSE'   then  return 0
/*ͺ*1*/    when ? == 'AND'     then  return a & b
/*ͺ*2*/    when ? == 'NAIMPB'  then  return \ (\a & \b)
/*ͺ*3*/    when ? == 'BOOLB'   then  return b
/*ͺ*4*/    when ? == 'NBIMPA'  then  return \ (\b & \a)
/*ͺ*5*/    when ? == 'BOOLA'   then  return a
/*ͺ*6*/    when ? == 'XOR'     then  return a && b
/*ͺ*7*/    when ? == 'OR'      then  return a |  b
/*ͺ*8*/    when ? == 'NOR'     then  return \ (a |  b)
/*ͺ*9*/    when ? == 'XNOR'    then  return \ (a && b)
/*ͺ*a*/    when ? == 'NOTB'    then  return \ b
/*ͺ*b*/    when ? == 'BIMPA'   then  return \ (b & \a)
/*ͺ*c*/    when ? == 'NOTA'    then  return \ a
/*ͺ*d*/    when ? == 'AIMPB'   then  return \ (a & \b)
/*ͺ*e*/    when ? == 'NAND'    then  return \ (a &  b)
/*ͺ*f*/    when ? == 'TRUE'    then  return 1
otherwise                 return -13
end   /*ͺ*select*/              /*ͺ* [β]  error, unknown function.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Truth-table\truth-table.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
