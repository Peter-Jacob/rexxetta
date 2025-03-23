/*�*REXX program displays a list,  then prompts the user for a selection number (integer).*/
do forever                               /*�*keep prompting until response is OK. */
call list_create                         /*�*create the list from scratch.        */
call list_show                           /*�*display (show)  the list to the user.*/
if newV2==0   then return ''                 /*�*if list is empty,  then return  null.*/
say right(' choose an item by entering a number from 1 ───►' newV2, 70, '═')
parse pull x                             /*�*get the user's choice  (if any).     */

select
when x=''              then call sayErr  "a choice wasn't entered"
when words(x)\==1      then call sayErr  'too many choices entered:'
when \datatype(x,'N')  then call sayErr  "the choice isn't numeric:"
when \datatype(x,'W')  then call sayErr  "the choice isn't an integer:"
when x<1 | x>newV2         then call sayErr  "the choice isn't within range:"
otherwise              leave       /*�*this leaves the    DO FOREVER   loop.*/
end   /*�*select*/
end         /*�*forever*/
/*�*user might've entered   2.  or  003  */
x=x/1                                            /*�*normalize the number (maybe).        */
say;  say 'you chose item' x": " newV1.x
return newV1.x                                       /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
list_create:   newV1.1= 'fee fie'                    /*�*this is one method for list-building.*/
newV1.2= 'huff and puff'
newV1.3= 'mirror mirror'
newV1.4= 'tick tock'
newV2=4                               /*�*store the number of choices in   #   */
return                            /*�*(above)  is just one convention.     */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
list_show:     say                               /*�*display a blank line.                */
do j=1  for newV2              /*�*display the list of choices.         */
say '[item'   j"]   " newV1.j  /*�*display item number with its choice. */
end   /*�*j*/
say                               /*�*display another blank line.          */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sayErr:        say;         say  '***error***'  arg(1)  x;          say;            return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Menu\menu.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
