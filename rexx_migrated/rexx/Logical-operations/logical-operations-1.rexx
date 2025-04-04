/*Š*REXX program  demonstrates some  binary  (also known as  bit  or logical)  operations.*/
x= 1    ;    newV1= ' x '   /*Š*set the initial values of  X  and Y, */
y= 0    ;    newV2= ' y '   /*Š*  and a couple of literals for HDRs. */
/*Š* [â]  echo  the   X  and  Y   values.*/
call $ 'name', "value"                           /*Š*display the  header  (title) line.   */
call $ 'x'   ,    x                              /*Š*display "x"  and then the value of X.*/
call $ 'y'   ,    y                              /*Š*   "    "y"   "    "   "    "    " Y */
/*Š* [â]  negate the X; then the Y value.*/
call $ 'name', "negated"                         /*Š*some REXXes support the  ÂŽ  character*/
call $ 'x'   ,   \x                              /*Š*display "x"  and then the value of ÂŽX*/
call $ 'y'   ,   \y                              /*Š*   "    "y"   "    "   "    "    " ÂŽY*/
say
say
call $ newV1, newV2, 'AND';    do x=0  to 1;   do y=0  to 1;   call $ x, y, x  & y;    end;  end
call $ newV1, newV2, 'OR' ;    do x=0  to 1;   do y=0  to 1;   call $ x, y, x  | y;    end;  end
call $ newV1, newV2, 'XOR';    do x=0  to 1;   do y=0  to 1;   call $ x, y, x && y;    end;  end
exit 0                                           /*Š*stick a fork in it,  we're all done. */
/*Š*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
$: parse arg newV3.1, newV3.2, newV3.3, newV3.4;         hdr= length(newV3.1) \== 1;        if hdr  then say
do j=0  to hdr;             newV4=
do k=1  for arg();    newV4= newV4  center(newV3.k, 7)
end   /*Š*k*/
say newV4
newV3.= copies('â', 7)                  /*Š*define a new header separator line.  */
end         /*Š*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Logical-operations\logical-operations-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
