uppercase: /*�*courtesy Gerard Schildberger */
return translate(changestr("ß",translate(arg(1),'ÄÖÜ',"äöü"),'SS'))

uppercase2: Procedure
Parse Arg a
a=translate(arg(1),'ÄÖÜ',"äöü")     /*�* translate lowercase umlaute */
a=changestr("ß",a,'SS')             /*�* replace ß with SS           */
return translate(a)                 /*�* translate lowercase letters */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-case\string-case-8.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
