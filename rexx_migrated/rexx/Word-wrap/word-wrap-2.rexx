/*ͺ*REXX program  reads  a  file  and  displays  it to the screen  (with word wrap).      */
parse arg iFID width kind newV2 .                    /*ͺ*obtain optional arguments from the CL*/
if  iFID=='' | iFID==","  then iFID = 'LAWS.TXT' /*ͺ*Not specified?  Then use the default.*/
if width=='' |width==","  then width= linesize() /*ͺ* "      "         "   "   "     "    */
if right(width, 1) =='%'  then width= linesize() * translate(width, , "%")  %  100
if kind=='' | kind==","   then kind= 'Left'      /*ͺ*Default?  Then use the default: LEFT */
just= left(kind, 1);  upper just                 /*ͺ*use 1st char of JUSTIFY,  uppercased.*/
if pos(just, 'BCLR')==0  then call err "KIND  (3rd arg) is illegal:"      kind
if newV2\==''                then call err "too many arguments specified."      newV2
if \datatype(width,'W')  then call err "WIDTH (2nd arg) isn't an integer:"  width
n=0                                              /*ͺ*the number of words in the file.     */
do j=0  while lines(iFID)\==0        /*ͺ*read from the file until End-Of-File.*/
newV2=linein(iFID)                       /*ͺ*get a record  (line of text).        */
do  until newV2=='';      n= n + 1  /*ͺ*extract some words  (or maybe not).  */
parse var newV2   newV1.n  newV2            /*ͺ*obtain and assign next word in text. */
end   /*ͺ*until*/                 /*ͺ*parse 'til the line of text is null. */
end        /*ͺ*j*/

if j==0   then call err  'file'  iFID  "not found."
if n==0   then call err  'file'  iFID  "is empty  (or has no words)"
newV3=newV1.1                                            /*ͺ*initialize  $  string with first word*/
do m=2  for n-1;           x= newV1.m    /*ͺ*parse until text  (@)  is exhausted. */
newV2= newV3 x                               /*ͺ*append it to the  $  string and test.*/
if length(newV2)>= width  then call tell /*ͺ*this word a bridge too far?   > w    */
newV3= newV2                                 /*ͺ*the new words are OK  (so far).      */
end   /*ͺ*m*/
call tell                                        /*ͺ*handle any residual words  (if any). */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:  say;    say '***error***';     say;     say arg(1);     say;      say;       exit 13
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell: if newV3==''  then return                      /*ͺ* [β]  the first word may be too long.*/
w=max(width, length(newV3) )                   /*ͺ*don't truncate long words  (> w).    */
select
when just=='L'  then newV3=  strip(newV3)    /*ͺ*left βββββββββ                       */
when just=='R'  then newV3=  right(newV3, w) /*ͺ*βββββββΊ right                        */
when just=='B'  then newV3=justify(newV3, w) /*ͺ*βββββbothβββββΊ                       */
when just=='C'  then newV3= center(newV3, w) /*ͺ*  βcenteredβΊ                         */
end   /*ͺ*select*/
say newV3                                      /*ͺ*display the line of words to terminal*/
newV2= x                                       /*ͺ*handle any word overflow.            */
return                                     /*ͺ*go back and keep truckin'.           */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-wrap\word-wrap-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
