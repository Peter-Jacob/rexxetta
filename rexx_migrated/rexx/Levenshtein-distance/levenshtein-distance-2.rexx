/*ª*rexx*/

call test 'kitten'      ,'sitting'
call test 'rosettacode' ,'raisethysword'
call test 'Sunday'      ,'Saturday'
call test 'Vladimir_Levenshtein[1965]',,
'Vladimir_Levenshtein[1965]'
call test 'this_algorithm_is_similar_to',,
'Damerau-Levenshtein_distance'
call test '','abc'
exit 0


test: Procedure
Parse Arg s,t
ld.=''
Say '          1st string  = >'s'<'
Say '          2nd string  = >'t'<'
Say 'Levenshtein distance  =' Levenshtein(s,length(s),t,length(t))
Say ''
Return


Levenshtein: Procedure
Parse Arg s,t
/*ª* for all i and j, d[i,j] will hold the Levenshtein distance between     */
/*ª* the first i characters of s and the first j characters of t;           */
/*ª* note that d has (m+1)*(n+1) values                                     */
m=length(s)
n=length(t)
d.=0
Do i=1 To m  /*ª* source prefixes can be transformed into empty string by */
d.i.0=i    /*ª* dropping all characters                                 */
End
Do j=1 To n  /*ª* target prefixes can be reached from empty source prefix */
d.0.j=j    /*ª* by inserting every character                            */
End
Do j=1 To n
jj=j-1
Do i=1 To m
ii=i-1
If substr(s,i,1)=substr(t,j,1) Then
d.i.j=d.ii.jj          /*ª* no operation required                   */
else
d.i.j=min(d.ii.j+1,,   /*ª* a deletion                              */
d.i.jj+1,,   /*ª* an insertion                            */
d.ii.jj+1)   /*ª* a substitution                          */
End
End
Say '          1st string  = '    s
Say '          2nd string  = '    t
say 'Levenshtein distance  = ' d.m.n;   say ''
Return d.m.n
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Levenshtein-distance\levenshtein-distance-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
