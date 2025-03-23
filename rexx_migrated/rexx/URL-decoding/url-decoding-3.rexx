/*�*REXX program converts & displays a URL─encoded string ──► its original unencoded form.*/
url. =
url.1='http%3A%2F%2Ffoo%20bar%2F'
url.2='mailto%3A%22Ivan%20Aim%22%20%3Civan%2Eaim%40email%2Ecom%3E'
url.3='%6D%61%69%6C%74%6F%3A%22%49%72%6D%61%20%55%73%65%72%22%20%3C%69%72%6D%61%2E%75%73%65%72%40%6D%61%69%6C%2E%63%6F%6D%3E'

do j=1  until url.j=='';   say       /*�*process each URL; display blank line.*/
say           url.j                  /*�*display the original URL.            */
say URLdecode(url.j)                 /*�*   "     "  decoded   "              */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
URLdecode:  procedure;  parse arg yyy            /*�*get encoded URL from argument list.  */
yyy= translate(yyy, , '+')           /*�*a special case for an encoded blank. */
URL=
do  until yyy==''
parse var  yyy     plain  '%'  +1  code  +2  yyy
URL= URL || plain
if datatype(code, 'X')  then URL= URL || x2c(code)
else URL= URL'%'code
end   /*�*until*/
return URL
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\URL-decoding\url-decoding-3.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
