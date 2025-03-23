/*�*REXX program checks for balanced brackets     [  ]      ─── some fixed, others random.*/
parse arg seed .                                 /*�*obtain optional argument from the CL.*/
if datatype(seed,'W')  then call random ,,seed   /*�*if specified, then use as RANDOM seed*/
newV1.=0;          yesNo.0= right('not OK', 50)      /*�*for bad expressions, indent 50 spaces*/
yesNo.1=           'OK'           /*�* [↓]  the 14 "fixed"  ][  expressions*/
q=                     ;          call checkBal  q;           say yesNo.result  '«null»'
q= '[][][][[]]'        ;          call checkBal  q;           say yesNo.result  q
q= '[][][][[]]]['      ;          call checkBal  q;           say yesNo.result  q
q= '['                 ;          call checkBal  q;           say yesNo.result  q
q= ']'                 ;          call checkBal  q;           say yesNo.result  q
q= '[]'                ;          call checkBal  q;           say yesNo.result  q
q= ']['                ;          call checkBal  q;           say yesNo.result  q
q= '][]['              ;          call checkBal  q;           say yesNo.result  q
q= '[[]]'              ;          call checkBal  q;           say yesNo.result  q
q= '[[[[[[[]]]]]]]'    ;          call checkBal  q;           say yesNo.result  q
q= '[[[[[]]]][]'       ;          call checkBal  q;           say yesNo.result  q
q= '[][]'              ;          call checkBal  q;           say yesNo.result  q
q= '[]][[]'            ;          call checkBal  q;           say yesNo.result  q
q= ']]][[[[]'          ;          call checkBal  q;           say yesNo.result  q
newV2=0                                                    /*�*# additional random expressions*/
do j=1  until  newV2==26                         /*�*gen 26 unique bracket strings. */
q=translate( rand( random(1,10) ), '][', 10) /*�*generate random bracket string.*/
call checkBal q; if result==-1  then iterate /*�*skip if duplicated expression. */
say yesNo.result  q                          /*�*display the result to console. */
newV2=newV2+1                                        /*�*bump the  expression  counter. */
end   /*�*j*/                            /*�* [↑]  generate 26 random "Q" strings.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
?:        ?=random(0,1);                                     return ? || \?   /*�*REXX BIF*/
rand:     $=copies(?()?(),arg(1));  newV3=random(2,length($));   return left($,newV3-1)substr($,newV3)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
checkBal: procedure expose newV1.; parse arg y       /*�*obtain the   "bracket"   expression. */
if newV1.y  then return -1                 /*�*Done this expression before?  Skip it*/
newV1.y=1                                  /*�*indicate expression was processed.   */
newV4=0;         do j=1  for length(y);      newV3=substr(y,j,1)    /*�*get a character.*/
if newV3=='[' then      newV4=newV4+1                      /*�*bump the nest #.*/
else do;  newV4=newV4-1;  if newV4<0  then return 0;   end
end   /*�*j*/
return newV4==0                            /*�* [↑]  "!" is the nested  ][  counter.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Balanced-brackets\balanced-brackets-1.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
