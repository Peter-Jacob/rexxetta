/*ª* REXX ***************************************************************
* Demonstrate how the history of assignments can be kept and shown
* 13.07.2012 Walter Pachl  Rewrite of Version 1 for (my) readability
*   varset.i.varu contains the ith value assigned to var
*   varset.0.varu contains the number of assignments so far
**********************************************************************/
varset.=0                          /*ª*initialize the assignment count */

call varset 'fluid',min(0,-5/2,-1)   ; say 'fluid=' fluid
call varset 'fluid',3.14159          ; say 'fluid=' fluid
call varset 'fluid',3.14159          ; say 'fluid=' fluid
call varset 'fluid',' Santa  Claus'  ; say 'fluid=' fluid
call varset 'FLUID',' Easter Rabbit' ; say 'fluid=' fluid

say 'There were' varset('fluid',,'L'),
'assignments (sets) for the FLUID variable.'
exit

varset: Procedure Expose varset.
/*ª**********************************************************************
* record values assigned to var (=varu as Rexx is case insensitive)
* Invoke with list<>'' to list the sequence of assigned values
* and return the number of assignments made (using this routine)
**********************************************************************/
Parse Upper Arg varu              /*ª* name of variable in uppercase */
Parse arg var,value,list          /*ª*varName, value, optional-List. */

if list='' then do                /*ª*not list, so set the X variable*/
z=varset.0.varu+1               /*ª*bump the history count (SETs). */
varset.z.varu=value             /*ª* ... and store it in "database"*/
varset.0.varu=z                 /*ª*the new history count          */
call value var,value            /*ª*now assign the value to var    */
end
else Do
Say ''                          /*ª*show blank line for readability*/
do i=1 to varset.0.varu         /*ª*list the assignment history    */
say 'history entry' i "for var" var":" varset.i.varu
end
end
Return varset.0.varu           /*ª*return the number of assignments. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\History-variables\history-variables-2.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
