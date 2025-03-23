/*�*REXX program executes a  Turing machine  based on   initial state,  tape, and rules.  */
state = 'q0'                                     /*�*the initial Turing machine state.    */
term  = 'qf'                                     /*�*a state that is used for a  halt.    */
blank = 'B'                                      /*�*this character is a  "true"  blank.  */
call TuringnewV5rule  'q0 1 1 right q0'              /*�*define a rule for the Turing machine.*/
call TuringnewV5rule  'q0 B 1 stay  qf'              /*�*   "   "   "   "   "     "      "    */
call TuringnewV5init   1 1 1                         /*�*initialize the tape to some string(s)*/
call TM                                          /*�*go and invoke the  Turning  machine. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
TM:  newV3=1;   bot=1;   top=1;   newV1= '***error***' /*�*start at  the tape location   1.     */
say                                         /*�*might as well display a blank line.  */
do cycle=1  until  state==term         /*�*process Turing machine  instructions.*/
do k=1  for rules                   /*�*   "       "       "        rules.   */
parse var rule.k rState rTape rWrite rMove rNext .          /*�*pick pieces. */
if state\==rState | newV2.newV3\==rTape  then iterate               /*�*wrong rule ? */
newV2.newV3=rWrite                          /*�*right rule;  write it ───► the tape. */
if rMove== 'left'  then newV3=newV3-1       /*�*Are we moving left?   Then subtract 1*/
if rMove=='right'  then newV3=newV3+1       /*�* "   "    "   right?    "    add    1*/
bot=min(bot, newV3);   top=max(top, newV3)  /*�*find the  tape  bottom and top.      */
state=rNext;       iterate cycle    /*�*use this for the next  state;  and   */
end   /*�*k*/
say newV1 'unknown state:' state;  leave /*�*oops, we have an unknown state error.*/
end   /*�*cycle*/
newV4=                                          /*�*start with empty string  (the tape). */
do t=bot  to top;        newV5=newV2.t
if newV5==blank  then newV5=' '                /*�*do we need to translate a true blank?*/
newV4=newV4 || pad || newV5                        /*�*construct char by char, maybe pad it.*/
end   /*�*t*/                            /*�* [↑]  construct  the  tape's contents*/
L=length(newV4)                                 /*�*obtain length of  "     "       "    */
if L==0     then newV4= "[tape is blank.]"      /*�*make an  empty tape  visible to user.*/
if L>1000   then newV4=left(newV4, 1000) ...        /*�*truncate tape to 1k bytes, append ···*/
say "tape's contents:"  newV4                   /*�*show the tape's contents (or 1st 1k).*/
say "tape's   length: " L                   /*�*  "   "     "   length.              */
say 'Turning machine used '    rules    " rules in "    cycle    ' cycles.'
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
TuringnewV5init:  newV2.=blank;  parse arg x;    do j=1  for words(x);  newV2.j=word(x,j);  end  /*�*j*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
TuringnewV5rule:  if symbol('RULES')=="LIT"  then rules=0;       rules=rules+1
pad=left('', length( word( arg(1),2 ) ) \==1 )          /*�*padding for rule*/
rule.rules=arg(1);         say right('rule' rules, 20)   "═══►"   rule.rules
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Universal-Turing-machine\universal-turing-machine-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
