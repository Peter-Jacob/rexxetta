/*ª*REXX program to check for balanced brackets [] **********************
* test strings and random string generation copied from Version 1
* the rest restructured (shortened) to some extent
* and output made reproducible (random with a seed)
* 10.07.2012 Walter Pachl
**********************************************************************/
yesno.0 = 'unbalanced'
yesno.1 = '  balanced'
done.=0                           /*ª* memory what's been done         */
n=0                               /*ª* number of tests                 */
Call testbal '[][][][[]]'         /*ª* first some user written tests   */
Call testbal '[][][][[]]]['
Call testbal '['
Call testbal ']'
Call testbal '[]'
Call testbal ']['
Call testbal '][]['
Call testbal '[[]]'
Call testbal '[[[[[[[]]]]]]]'
Call testbal '[[[[[]]]][]'
Call testbal '[][]'
Call testbal '[]][[]'
Call testbal ']]][[[[]'
Call testbal ']'
Call testbal '['
/*ª* then some random generated ones */
Call random 1,2,12345             /*ª* call random with a seed         */
/*ª* makes test reproducible         */
do Until n=30                     /*ª* up to 30 tests                  */
s=rand(random(1,8))             /*ª* a 01 etc. string of length 4-32 */
q=translate(s,'[]',01)          /*ª* turn digits into brackets       */
if done.q then                  /*ª* string was already here         */
iterate                       /*ª* don't test again                */
call testbal q                  /*ª* test balance                    */
End
exit

testbal:                    /*ª* test the given string and show result */
n=n+1                           /*ª* number of tests                 */
Parse Arg q                     /*ª* get string to be tested         */
done.q=1                        /*ª* mark as done                    */
call checkBal q                 /*ª* test balance                    */
lq=format(length(q),2)
say right(n,2) lq yesno.result q/*ª* show result and string          */
Return

/*ª*-----------------------------------PAND subroutine-----------------*/
pand: p=random(0,1);    return p || \p
/*ª*-----------------------------------RAND subroutine-----------------*/
rand: pp=pand();   pp=pand()pp;    pp=copies(pp,arg(1))
i=random(2,length(pp));      pp=left(pp,i-1)substr(pp,i)
return pp

checkBal: procedure               /*ª*check for balanced brackets ()   */
Parse arg y
nest=0;
do While y<>''
Parse Var y c +1 y            /*ª*pick off one character at a time */
if c='[' then                 /*ª* opening bracket                 */
nest=nest+1                 /*ª* increment nesting               */
else do                       /*ª* closing bracket                 */
if nest=0 then              /*ª* not allowed                     */
return 0;                 /*ª* no success                      */
nest=nest-1                 /*ª* decrement nesting               */
end
end
return nest=0                   /*ª* nest=0 -> balanced              */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Balanced-brackets\balanced-brackets-2.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
