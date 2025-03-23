/*ª*the  WHEN  conditional operators are the same as*/
/*ª*the   IF   conditional operators.               */
select
when t<0        then z=abs(u)
when t=0 & y=0  then z=0
when t>0        then do
y=sqrt(z)
z=u**2
end

/*ª*if control reaches here & none of the WHENs were*/
/*ª*satisfiied, a SYNTAX (error) condition is raised*/
end  /*ª*1st select*/

select
when a=='angel'              then many='host'
when a=='ass' | a=='donkey'  then many='pace'
when a=='crocodile'          then many='bask'
when a=='crow'               then many='murder'
when a=='lark'               then many='ascension'
when a=='quail'              then many='bevy'
when a=='wolf'               then many='pack'
otherwise                         many='?'
end  /*ª*2nd select*/          /*ª* [â†‘]  uses OTHERWISE as a catch-all.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Conditional-structures\conditional-structures-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
