/*�*REXX program displays a truth table of  variables and an expression.   Infix notation */
/*�*─────────────── is supported with one character propositional constants;  variables   */
/*�*─────────────── (propositional constants) that are allowed:  A──►Z,  a──►z   except u.*/
/*�*─────────────── All propositional constants are case insensitive (except lowercase u).*/

parse arg userText                               /*�*get optional expression from the CL. */
if userText\=''  then do                         /*�*Got one?   Then show user's stuff.   */
call truthTable userText   /*�*display truth table for the userText.*/
exit                       /*�*we're finished with the user's text. */
end

call truthTable  "G ^ H ; XOR"                   /*�*text after ; is echoed to the output.*/
call truthTable  "i | j ; OR"
call truthTable  "G nxor H ; NXOR"
call truthTable  "k ! t ; NOR"
call truthTable  "p & q ; AND"
call truthTable  "e ����ֱ� f ; NAND"
call truthTable  "S | (T ^ U)"
call truthTable  "(p=>q) v (q=>r)"
call truthTable  "A ^ (B ^ (C ^ D))"
exit                                             /*�*quit while we're ahead,  by golly.   */

/*�* ↓↓↓ no way, Jose. ↓↓↓ */                  /*�* [↓]  shows a 32,768 line truth table*/
call truthTable  "A^ (B^ (C^ (D^ (E^ (F^ (G^ (H^ (I^ (J^ (L^ (L^ (M^ (N^O)  ))))))))))))"
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
truthTable: procedure; parse arg newV7 ';' comm 1 newV4;        newV4=  strip(newV4);      hdrPCs=
newV7= translate(strip(newV7), '|', "v");         newV5=  newV7;              upper newV5
newV5= translate(newV5, '()()()', "[]{}«»");     newV3.= 0;              PCs=
newV2= 'abcdefghijklmnopqrstuvwxyz';          newV1= newV2;         upper newV1

/*�* ╔═════════════════════╦════════════════════════════════════════════════════════════╗
║                     ║                  bool(bitsA, bitsB, BF)                    ║
║                     ╟────────────────────────────────────────────────────────────╢
║                     ║ performs the boolean function  BF    ┌──────┬─────────┐    ║
║                     ║      on the   A   bitstring          │  BF  │ common  │    ║
║                     ║    with the   B   bitstring.         │ value│  name   │    ║
║                     ║                                      ├──────┼─────────����ַ    ║
║                     ║ BF   must be a  one to four bit      │ 0000 │boolfalse│    ║
║                     ║ value  (from  0000 ──► 1111),        │ 0001 │ and     │    ║
║  This boxed table   ║ leading zeroes can be omitted.       │ 0010 │ NaIMPb  │    ║
║ was re─constructed  ║                                      │ 0011 │ boolB   │    ║
║   from an old IBM   ║ BF   may have multiple values (one   │ 0100 │ NbIMPa  │    ║
║    publicastion:    ║ for each pair of bitstrings):        │ 0101 │ boolA   │    ║
║                     ║                                      │ 0110 │ xor     │    ║
║   "PL/I Language    ║  ┌──────┬──────┬───────────────┐     │ 0111 │ or      │    ║
║   Specifications"   ║  │ Abit │ Bbit │   returns     │     │ 1000 │ nor     │    ║
║                     ║  ├──────┼──────┼───────────────����ַ     │ 1001 │ nxor    │    ║
║                     ║  │   0  │   0  │ 1st bit in BF │     │ 1010 │ notB    │    ║
║                     ║  │   0  │   1  │ 2nd bit in BF │     │ 1011 │ bIMPa   │    ║
║   ─── March 1969.   ║  │   1  │   0  │ 3rd bit in BF │     │ 1100 │ notA    │    ║
║                     ║  │   1  │   1  │ 4th bit in BF │     │ 1101 │ aIMPb   │    ║
║                     ║  └──────┴──────┴───────────────┘     │ 1110 │ nand    │    ║
║                     ║                                      │ 1111 │booltrue │    ║
║                     ║                                   ┌──┴──────┴─────────����ַ    ║
║                     ║                                   │ A  0101           │    ║
║                     ║                                   │ B  0011           │    ║
║                     ║                                   └───────────────────┘    ║
╚═════════════════════╩════════════════════════════════════════════════════════════╝ */

newV8= 'ff'x                                       /*�* [↓]  ───── infix operators (0──►15) */
op.=                                           /*�*Note:   a  single quote  (')  wasn't */
/*�*            implemented for negation.*/
op.0 = 'false  boolFALSE'                      /*�*unconditionally  FALSE               */
op.1 = '&      and *'                          /*�* AND,  conjunction                   */
op.2 = 'naimpb NaIMPb'                         /*�*not A implies B                      */
op.3 = 'boolb  boolB'                          /*�*B  (value of)                        */
op.4 = 'nbimpa NbIMPa'                         /*�*not B implies A                      */
op.5 = 'boola  boolA'                          /*�*A  (value of)                        */
op.6 = '&&     xor % ^'                        /*�* XOR,  exclusive OR                  */
op.7 = '|      or + v'                         /*�*  OR,  disjunction                   */
op.8 = 'nor    nor ! ↓'                        /*�* NOR,  not OR,  Pierce operator      */
op.9 = 'xnor   xnor nxor'                      /*�*NXOR,  not exclusive OR,  not XOR    */
op.10= 'notb   notB'                           /*�*not B  (value of)                    */
op.11= 'bimpa  bIMPa'                          /*�*    B  implies A                     */
op.12= 'nota   notA'                           /*�*not A  (value of)                    */
op.13= 'aimpb  aIMPb'                          /*�*    A  implies B                     */
op.14= 'nand   nand ����ֱ� ↑'                       /*�*NAND,  not AND,  Sheffer operator    */
op.15= 'true   boolTRUE'                       /*�*unconditionally   TRUE               */
/*�*alphabetic names that need changing. */
op.16= '\   NOT ~ ─ . ¬'                       /*�* NOT,  negation                      */
op.17= '>   GT'                                /*�*conditional                          */
op.18= '>=  GE ─> => ──> ==>'   "1a"x          /*�*conditional;     (see note below.)──┐*/
op.19= '<   LT'                                /*�*conditional                         │*/
op.20= '<=  LE <─ <= <── <=='                  /*�*conditional                         │*/
op.21= '\=  NE ~= ─= .= ¬='                    /*�*conditional                         │*/
op.22= '=   EQ EQUAL EQUALS ='  "1b"x          /*�*bi─conditional;  (see note below.)┐ │*/
op.23= '0   boolTRUE'                          /*�*TRUEness                          │ │*/
op.24= '1   boolFALSE'                         /*�*FALSEness                         ↓ ↓*/
/*�* [↑] glphys  '1a'x  and  "1b"x  can't*/
/*�*     displayed under most DOS' & such*/
do jj=0  while  op.jj\=='' | jj<16           /*�*change opers ──► into what REXX likes*/
new= word(op.jj, 1)                          /*�*obtain the 1st token of  infex table.*/
/*�* [↓]  process the rest of the tokens.*/
do kk=2  to words(op.jj)                   /*�*handle each of the tokens separately.*/
newV9=word(op.jj, kk);          upper newV9        /*�*obtain another token from infix table*/
if wordpos(newV9, newV5)==0   then iterate        /*�*no such animal in this string.       */
if datatype(new, 'm')  then newnewV10= newV8        /*�*it            needs to be transcribed*/
else newnewV10= new      /*�*it  doesn't   need   "  "     "      */
newV5= changestr(newV9, newV5, newnewV10)                 /*�*transcribe the function (maybe).     */
if newnewV10==newV8  then newV5= changeFunc(newV5,newV8,new)  /*�*use the internal boolean name.       */
end   /*�*kk*/
end     /*�*jj*/

newV5=translate(newV5, '()', "{}")                   /*�*finish cleaning up the transcribing. */

do jj=1  for length(newV1)               /*�*see what variables are being used.   */
newV9= substr(newV1, jj, 1)                  /*�*use the available upercase aLphabet. */
if pos(newV9,newV5) == 0  then iterate          /*�*Found one?    No, then keep looking. */
newV3.jj= 1                                 /*�*found:  set upper bound for it.      */
PCs= PCs newV9                             /*�*also, add to propositional constants.*/
hdrPCs=hdrPCS center(newV9,length('false'))  /*�*build a PC header for transcribing.  */
end   /*�*jj*/

ptr= '_────►_'                                 /*�*a (text) pointer for the truth table.*/
newV5= PCs '('newV5")"                              /*�*separate the  PCs  from expression.  */
hdrPCs= substr(hdrPCs, 2)                      /*�*create a header for the  PCs.        */
say hdrPCs left('', length(ptr) - 1)   newV4      /*�*display  PC  header and expression.  */
say copies('───── ', words(PCs))    left('', length(ptr) -2)  copies('─', length(newV4))
/*�*Note:  "true"s:  are right─justified.*/
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
/*�*evaluate truth T.*/
newV9= changestr(1, newV9, '_true') /*�*convert 1──►_true*/
newV9= changestr(0, newV9, 'false') /*�*convert 0──►false*/
newV9= insert(ptr,  newV9, wordindex(newV9, words(newV9) )  - 1)
say translate(newV9, , '_')     /*�*display truth tab*/
end   /*�*z*/
end    /*�*y*/
end     /*�*x*/
end      /*�*w*/
end       /*�*v*/
end        /*�*u*/
end         /*�*t*/
end          /*�*s*/
end           /*�*r*/
end            /*�*q*/
end             /*�*p*/
end              /*�*o*/
end               /*�*n*/
end                /*�*m*/
end                 /*�*l*/
end                  /*�*k*/
end                   /*�*j*/
end                    /*�*i*/
end                     /*�*h*/
end                      /*�*g*/
end                       /*�*f*/
end                        /*�*e*/
end                         /*�*d*/
end                          /*�*c*/
end                           /*�*b*/
end                            /*�*a*/
say;  say
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
scan: procedure; parse arg x,at;      L= length(x);   t=L;    Lp=0;    apost=0;    quote=0
if at<0  then      do;   t=1;   x= translate(x, '()', ")(")
end                      /*�* [↓]  get 1 or 2 chars at location J*/

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
if at<0              then return j + 1              /*�*is   _    uppercase ? */
end   /*�*j*/

return min(j, L)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
changeFunc: procedure;  parse arg z, fC, newF ;           funcPos= 0

do forever
funcPos= pos(fC, z, funcPos + 1);           if funcPos==0  then return z
origPos= funcPos
z= changestr(fC, z, ",'"newF"',") /*�*arg 3 ����ֱ�  ",'" || newF || "-',"  */
funcPos= funcPos + length(newF) + 4
where= scan(z, funcPos)       ;           z= insert(    '}',  z,  where)
where= scan(z, 1 - origPos)   ;           z= insert('bool{',  z,  where)
end   /*�*forever*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bool: procedure; arg a,?,b                              /*�* ◄─── ARG uppercases all args.*/

select                        /*�*SELECT chooses which function.*/
/*�*0*/    when ? == 'FALSE'   then  return 0
/*�*1*/    when ? == 'AND'     then  return a & b
/*�*2*/    when ? == 'NAIMPB'  then  return \ (\a & \b)
/*�*3*/    when ? == 'BOOLB'   then  return b
/*�*4*/    when ? == 'NBIMPA'  then  return \ (\b & \a)
/*�*5*/    when ? == 'BOOLA'   then  return a
/*�*6*/    when ? == 'XOR'     then  return a && b
/*�*7*/    when ? == 'OR'      then  return a |  b
/*�*8*/    when ? == 'NOR'     then  return \ (a |  b)
/*�*9*/    when ? == 'XNOR'    then  return \ (a && b)
/*�*a*/    when ? == 'NOTB'    then  return \ b
/*�*b*/    when ? == 'BIMPA'   then  return \ (b & \a)
/*�*c*/    when ? == 'NOTA'    then  return \ a
/*�*d*/    when ? == 'AIMPB'   then  return \ (a & \b)
/*�*e*/    when ? == 'NAND'    then  return \ (a &  b)
/*�*f*/    when ? == 'TRUE'    then  return 1
otherwise                 return -13
end   /*�*select*/              /*�* [↑]  error, unknown function.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Truth-table\truth-table.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
