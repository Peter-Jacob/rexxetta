/*ª*REXX program to expand a range of integers into a list. *************
* 09.08.2012 Walter Pachl
**********************************************************************/

parse arg old
if old = '' then -
old='-6,-3--1,3-5,7-11,14,15,17-20' /*ª*original list of nums/ranges */

Say 'old='old                     /*ª*show old list of nums/ranges.  */
a=translate(old,,',')             /*ª*translate commas to blanks     */
new=''                            /*ª*new list of numbers (so far).  */

comma=''
Do While a<>''                    /*ª* as long as there is input     */
Parse var a x a                 /*ª* get one element               */
dashpos=pos('-',x,2)            /*ª* find position of dash, if any */
If dashpos>0 Then Do            /*ª* element is low-high           */
Parse Var x low newV1 +1 high /*ª* split the element        */
Do j=low To high              /*ª* output all numbers in range   */
new=new||comma||j           /*ª* with separating commas        */
comma=','                   /*ª* from now on use comma         */
End
End
Else Do                         /*ª* element is a number           */
new=new||comma||x             /*ª* append (with comma)           */
comma=','                     /*ª* from now on use comma         */
End
End
Say 'new='new                     /*ª*show the expanded list         */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-expansion\range-expansion-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
