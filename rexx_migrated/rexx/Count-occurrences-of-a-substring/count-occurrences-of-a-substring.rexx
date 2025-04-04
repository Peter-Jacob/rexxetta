/*ͺ*REXX program counts the  occurrences  of a (nonβoverlapping)  substring  in a string. */
w=.                                                                 /*ͺ*max. width so far.*/
bag= 'the three truths'    ;      x= "th"       ;        call showResult
bag= 'ababababab'          ;      x= "abab"     ;        call showResult
bag= 'aaaabacad'           ;      x= "aa"       ;        call showResult
bag= 'abaabba*bbaba*bbab'  ;      x= "a*b"      ;        call showResult
bag= 'abaabba*bbaba*bbab'  ;      x= " "        ;        call showResult
bag=                       ;      x= "a"        ;        call showResult
bag=                       ;      x=            ;        call showResult
bag= 'catapultcatalog'     ;      x= "cat"      ;        call showResult
bag= 'aaaaaaaaaaaaaa'      ;      x= "aa"       ;        call showResult
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
countstr:   procedure;  parse arg haystack,needle,start;      if start==''  then start=1
width=length(needle)
do newV1=0  until p==0;         p=pos(needle,haystack,start)
start=width + p                    /*ͺ*prevent overlaps.*/
end   /*ͺ*$*/
return newV1                                                 /*ͺ*return the count.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showResult: if w==. then do;                   w=30        /*ͺ*W:  largest haystack width.*/
say center('haystack',w)  center('needle',w%2)  center('count',5)
say left('', w, "β")      left('', w%2, "β")    left('', 5, "β")
end

if bag==''  then bag= " (null)"                /*ͺ*handle displaying of nulls.*/
if   x==''  then   x= " (null)"                /*ͺ*   "        "      "   "   */
say left(bag, w)           left(x, w%2)            center(countstr(bag, x), 5)
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-occurrences-of-a-substring\count-occurrences-of-a-substring.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
