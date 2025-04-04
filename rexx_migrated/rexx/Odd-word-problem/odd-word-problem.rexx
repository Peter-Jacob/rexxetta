/*ͺ*REXX program solves the  odd word problem  by only using  (single) byte  input/output.*/
iFID_ = 'ODDWORD.IN'  /*ͺ*Note:  numeric suffix is added later.*/
oFID_ = 'ODDWORD.'    /*ͺ*  "       "       "    "   "     "   */
do case=1  for 2;                newV1= 0       /*ͺ*#:  is the number of characters read.*/
iFID= iFID_  ||  case                       /*ͺ*read   ODDWORD.IN1  or  ODDWORD.IN2  */
oFID= oFID_  ||  case                       /*ͺ*write  ODDWORD.1    or  ODDWORD.2    */
say;   say;    say 'ββββββββ reading file: '        iFID        "ββββββββ"                /*ͺ* ββ β β β β β β β β  optional. */

do  until x==.                          /*ͺ* [β]  perform until reaching a period*/
do  until \datatype(x, 'M')      /*ͺ* [β]     "      "   punctuation found*/
call rChar                       /*ͺ*read  a single character.            */
call wChar                       /*ͺ*write "    "       "                 */
end   /*ͺ*until \dataΒ·Β·Β·*/         /*ͺ* [β]  read/write until punctuation.  */
if x==.  then leave                     /*ͺ*is this the endβofβsentence (period)?*/
call readLetters;            punct= newV1   /*ͺ*save the location of the punctuation.*/
do j=newV1-1  by -1                  /*ͺ*read some characters backwards.      */
call rChar j                     /*ͺ*read previous word (backwards).      */
if \datatype(x, 'M')  then leave /*ͺ*Found punctuation?   Then leave  J.  */
call wChar                       /*ͺ*write a character (which is a letter)*/
end   /*ͺ*j*/                      /*ͺ* [β]  perform for  "even"  words.    */
call rLett                              /*ͺ*read letters until punctuation found.*/
call wChar;                  newV1= punct   /*ͺ*write a char;  punctuation location. */
end      /*ͺ*until x==.*/
end          /*ͺ*case*/                       /*ͺ* [β]  process both of the input files*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rLett: do  until  \datatype(x, 'M');         call rChar;             end;         return
wChar: call charout , x  /*ͺ*console*/;        call charout oFID, x  /*ͺ*file*/;      return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rChar: if arg()==0  then do; x= charin(iFID); newV1= newV1+1; end  /*ͺ*read  next  char*/
else     x= charin(iFID, arg(1) );     /*ͺ*  " specific  " */   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Odd-word-problem\odd-word-problem.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
