/*�*REXX pgm demonstrates some binary (also known as bit or logical)  extended operations.*/
x= 1    ;    newV1= ' x '   /*�*set the initial values of  X  and Y, */
y= 0    ;    newV2= ' y '   /*�*  and a couple of literals for HDRs. */
/*�* [↓]  echo  the   X  and  Y   values.*/
call $ 'name', "value"                           /*�*display the  header  (title) line.   */
call $ 'x'   ,    x                              /*�*display "x"  and then the value of X.*/
call $ 'y'   ,    y                              /*�*   "    "y"   "    "   "    "    " Y */
/*�* [↓]  negate the X; then the Y value.*/
call $ 'name', "negated"                         /*�*some REXXes support the  ¬  character*/
call $ 'x'   ,   \x                              /*�*display "x"  and then the value of ¬X*/
call $ 'y'   ,   \y                              /*�*   "    "y"   "    "   "    "    " ¬Y*/
say                                              /*�*note:  NXOR  is also known as  XNOR. */
say                                              /*�*all  16  boolean operations could ···*/
/*�*  be shown, but only the commonly ···*/
/*�*  known functions will be shown here.*/
call $ newV1, newV2, 'AND' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x  & y ;  end; end
call $ newV1, newV2, 'NAND';   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x  & y);  end; end
call $ newV1, newV2, 'OR'  ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x  | y ;  end; end
call $ newV1, newV2, 'NOR' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x  | y);  end; end
call $ newV1, newV2, 'XOR' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x && y ;  end; end
call $ newV1, newV2, 'NXOR';   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x && y);  end; end
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
$: parse arg newV3.1, newV3.2, newV3.3, newV3.4;            hdr= length(newV3.1) \== 1;     if hdr  then say
do j=0  to hdr;               newV4=
do k=1  for arg();      newV4=newV4  center(newV3.k, 7)
end   /*�*k*/
say newV4
newV3.= copies('═', 7)                 /*�*define a new separator (header) line.*/
end         /*�*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Logical-operations\logical-operations-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
