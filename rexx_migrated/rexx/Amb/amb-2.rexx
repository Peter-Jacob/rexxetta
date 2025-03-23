/*ª*REXX program  demonstrates  the   Amd   operator,   choosing a  word  from each  set. */
newV1.1 = "the     that      a"
newV1.2 = "frog    elephant  thing"
newV1.3 = "walked  treaded   grows"
newV1.4 = "slowly  quickly"
newV1.0 = 4                           /*ª*define the number of sets being ised.*/
call Amb 1                                       /*ª*find all word combinations that works*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*--------------------------------------------------------------------------------------*/
Amb: procedure expose newV1.;   parse arg newV2 x;     arg . u       /*ª*ARG uppercases U value.  */
if newV2>newV1.0  then do;  y= word(u, 1)                       /*ª*Y:  is a  uppercased  U. */
do n=2  to words(u);                newV3= word(u, n)
if left(newV3, 1) \== right(y, 1)  then return;    y= newV3
end   /*ª*n*/
say strip(x)                        /*ª*Â¬show superfluous blanks.*/
end
do j=1  for words(newV1.newV2);  call Amb newV2+1 x word(newV1.newV2, j) /*ª*gen all combos recursively*/
end   /*ª*j*/;             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Amb\amb-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
