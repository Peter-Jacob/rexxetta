/*�*REXX program  reads  a  file  and  displays  it to the screen  (with word wrap).      */
parse arg iFID width kind newV2 .                    /*�*obtain optional arguments from the CL*/
if  iFID=='' | iFID==","  then iFID = 'LAWS.TXT' /*�*Not specified?  Then use the default.*/
if width=='' |width==","  then width= linesize() /*�* "      "         "   "   "     "    */
if right(width, 1) =='%'  then width= linesize() * translate(width, , "%")  %  100
if kind=='' | kind==","   then kind= 'Left'      /*�*Default?  Then use the default: LEFT */
just= left(kind, 1);  upper just                 /*�*use 1st char of JUSTIFY,  uppercased.*/
if pos(just, 'BCLR')==0  then call err "KIND  (3rd arg) is illegal:"      kind
if newV2\==''                then call err "too many arguments specified."      newV2
if \datatype(width,'W')  then call err "WIDTH (2nd arg) isn't an integer:"  width
n=0                                              /*�*the number of words in the file.     */
do j=0  while lines(iFID)\==0        /*�*read from the file until End-Of-File.*/
newV2=linein(iFID)                       /*�*get a record  (line of text).        */
do  until newV2=='';      n= n + 1  /*�*extract some words  (or maybe not).  */
parse var newV2   newV1.n  newV2            /*�*obtain and assign next word in text. */
end   /*�*until*/                 /*�*parse 'til the line of text is null. */
end        /*�*j*/

if j==0   then call err  'file'  iFID  "not found."
if n==0   then call err  'file'  iFID  "is empty  (or has no words)"
newV3=newV1.1                                            /*�*initialize  $  string with first word*/
do m=2  for n-1;           x= newV1.m    /*�*parse until text  (@)  is exhausted. */
newV2= newV3 x                               /*�*append it to the  $  string and test.*/
if length(newV2)>= width  then call tell /*�*this word a bridge too far?   > w    */
newV3= newV2                                 /*�*the new words are OK  (so far).      */
end   /*�*m*/
call tell                                        /*�*handle any residual words  (if any). */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:  say;    say '***error***';     say;     say arg(1);     say;      say;       exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell: if newV3==''  then return                      /*�* [↓]  the first word may be too long.*/
w=max(width, length(newV3) )                   /*�*don't truncate long words  (> w).    */
select
when just=='L'  then newV3=  strip(newV3)    /*�*left ◄────────                       */
when just=='R'  then newV3=  right(newV3, w) /*�*──────► right                        */
when just=='B'  then newV3=justify(newV3, w) /*�*◄────both────►                       */
when just=='C'  then newV3= center(newV3, w) /*�*  ◄centered►                         */
end   /*�*select*/
say newV3                                      /*�*display the line of words to terminal*/
newV2= x                                       /*�*handle any word overflow.            */
return                                     /*�*go back and keep truckin'.           */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-wrap\word-wrap-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
