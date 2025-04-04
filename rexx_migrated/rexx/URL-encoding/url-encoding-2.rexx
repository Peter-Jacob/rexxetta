/*ª*REXX program encodes a  URL  text,    blanks âââº +,    preserves  -._*    and   -._~  */
url.=;                              url.1= 'http://foo bar/'
url.2= 'mailto:"Ivan Aim" <ivan.aim@email.com>'
url.3= 'mailto:"Irma User" <irma.user@mail.com>'
url.4= 'http://foo.bar.com/~user-name/_subdir/*ª*~.html§
do j=1  while url.j\=='';  say
say '  original: '             url.j
say '   encoded: '   URLencode(url.j)
end   /*ª*j*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
URLencode: procedure; parse arg $,,z;        t1= '-._~'              /*ª*get args, null Z.*/
skip=0;                           t2= '-._*'
do k=1  for length($);   _=substr($, k, 1)       /*ª*get a character. */
if skip\==0  then do;    skip=skip-1             /*ª*skip t1 or t2 ?  */
iterate                 /*ª*skip a character.*/
end
select
when datatype(_, 'A')    then z=z || _        /*ª*is alphanumeric ?*/
when _==' '              then z=z'+'          /*ª*is it  a  blank ?*/
when substr($, k, 4)==t1 |,                   /*ª*is it  t1 or t2 ?*/
substr($, k, 4)==t2   then do;  skip=3   /*ª*skip 3 characters*/
z=z || substr($, k, 4)
end
otherwise   z=z'%'c2x(_)                      /*ª*special character*/
end   /*ª*select*/
end      /*ª*k*/
return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\URL-encoding\url-encoding-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
