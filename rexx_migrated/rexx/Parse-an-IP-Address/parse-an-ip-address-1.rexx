/*�*REXX program parses an  IP address  into  ──►  IPv4  or  IPv6 format,  optional pport.*/
newV3= "_";    say center('input IP address'   , 30),
center('hex IP address'     , 32),
center('decimal IP address' , 39)         "space  port"
say copies(newV3, 30)   copies(newV3, 32)   copies(newV3, 39)   copies(newV3, 5)   copies(newV3, 5)
call IPnewV3parse  newV1.0.0.1                         /*�*this simple  IP  doesn't need quotes.*/
call IPnewV3parse '127.0.0.1:80'
call IPnewV3parse '::1'
call IPnewV3parse '[::1]:80'
call IPnewV3parse '2605:2700:0:3::4713:93e3'
call IPnewV3parse '[2605:2700:0:3::4713:93e3]:80'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
IPnewV3parse:  procedure;  parse arg a .;       hx=;              newV2.=;       numeric digits 50
dot= pos(., a)\==0                    /*�*see if there is a dot present in IP. */

if dot then do;   parse var   a    newV2.1  '.'  newV2.2  "."  newV2.3  '.'  newV2.4  ":"  port
do j=1  for 4;    hx= hx  ||  d2x(newV2.j, 2)
end   /*�*j*/
end
else do;   parse var  a  pureA  ']:'  port
newV3= space( translate( pureA, , '[]'), 0)        /*�*remove brackets.*/
parse var newV3 x '::' y
do L=1  until x==''       /*�*get  left side. */
parse var  x  newV2.L  ':'  x
end   /*�*L*/
y= reverse(y)
do r=8  by -1             /*�*get right side. */
parse var  y  z  ':'  y;   if z=='' then leave
newV2.r= reverse(z)
end   /*�*r*/

do k=1  for 8;  hx=hx  ||  right( word(newV2.k 0, 1), 4, 0)
end   /*�*k*/
end

say left(a,30) right(hx,32) right(x2d(hx),39) ' IPv' || (6-2*dot) right(port,5)
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parse-an-IP-Address\parse-an-ip-address-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
