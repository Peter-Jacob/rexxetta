/*ช*REXX pgm demonstrates some binary (also known as bit or logical)  extended operations.*/
x= 1    ;    newV1= ' x '   /*ช*set the initial values of  X  and Y, */
y= 0    ;    newV2= ' y '   /*ช*  and a couple of literals for HDRs. */
/*ช* [โ]  echo  the   X  and  Y   values.*/
call $ 'name', "value"                           /*ช*display the  header  (title) line.   */
call $ 'x'   ,    x                              /*ช*display "x"  and then the value of X.*/
call $ 'y'   ,    y                              /*ช*   "    "y"   "    "   "    "    " Y */
/*ช* [โ]  negate the X; then the Y value.*/
call $ 'name', "negated"                         /*ช*some REXXes support the  ยฌ  character*/
call $ 'x'   ,   \x                              /*ช*display "x"  and then the value of ยฌX*/
call $ 'y'   ,   \y                              /*ช*   "    "y"   "    "   "    "    " ยฌY*/
say                                              /*ช*note:  NXOR  is also known as  XNOR. */
say                                              /*ช*all  16  boolean operations could ยทยทยท*/
/*ช*  be shown, but only the commonly ยทยทยท*/
/*ช*  known functions will be shown here.*/
call $ newV1, newV2, 'AND' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x  & y ;  end; end
call $ newV1, newV2, 'NAND';   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x  & y);  end; end
call $ newV1, newV2, 'OR'  ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x  | y ;  end; end
call $ newV1, newV2, 'NOR' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x  | y);  end; end
call $ newV1, newV2, 'XOR' ;   do x=0  to 1;   do y=0  to 1;   call $ x, y,   x && y ;  end; end
call $ newV1, newV2, 'NXOR';   do x=0  to 1;   do y=0  to 1;   call $ x, y, \(x && y);  end; end
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
$: parse arg newV3.1, newV3.2, newV3.3, newV3.4;            hdr= length(newV3.1) \== 1;     if hdr  then say
do j=0  to hdr;               newV4=
do k=1  for arg();      newV4=newV4  center(newV3.k, 7)
end   /*ช*k*/
say newV4
newV3.= copies('โ', 7)                 /*ช*define a new separator (header) line.*/
end         /*ช*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Logical-operations\logical-operations-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
