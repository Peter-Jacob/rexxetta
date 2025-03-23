/*�*REXX program  displays  the  moves  to solve  the  Tower of Hanoi  (with  N  disks).  */
parse arg N .                                    /*�*get optional number of disks from CL.*/
if N=='' | N==","  then N=3                      /*�*Not specified?  Then use the default.*/
sw= 80;    wp= sw%3 - 1;   blanks= left('', wp)  /*�*define some default REXX variables.  */
c.1= sw % 3 % 2                                  /*�* [↑]  SW: assume default Screen Width*/
c.2= sw % 2 - 1                                  /*�* ◄───  C.1 C.2 C.2  are the positions*/
c.3= sw - 2 - c.1                                /*�*                    of the 3 columns.*/
newV6= 0;        z= 2**N - 1;           moveK= z     /*�*#moves; min# of moves; where to move.*/
newV1= 'abcdefghijklmnopqrstuvwxyN'               /*�*dithering chars when many disks used.*/
ebcdic= ('f2'x==2)                               /*�*determine if EBCDIC or ASCII machine.*/

if ebcdic then do;   bar= 'bf'x;    ar= "df"x;    dither= 'db9f9caf'x;         down= "9a"x
tr= 'bc'x;    bl= "ab"x;    br= 'bb'x;   vert= "fa"x;      tl= 'ac'x
end
else do;   bar= 'c4'x;    ar= "10"x;    dither= 'b0b1b2db'x;         down= "19"x
tr= 'bf'x;    bl= "c0"x;    br= 'd9'x;   vert= "b3"x;      tl= 'da'x
end

verts= vert || vert;           Tcorners= tl || tr;              box     = left(dither, 1)
downs= down || down;           Bcorners= bl || br;              boxChars= dither || newV1
newV2.= 0;         newV2.1= N;         k= N;                            kk= k + k

do j=1  for N;   newV3.3.j= blanks;    newV3.2.j= blanks;    newV3.1.j= center( copies(box, kk), wp)
if N<=length(boxChars)  then newV3.1.j= translate( newV3.1.j, , substr( boxChars, kk%2, 1), box)
kk= kk - 2
end   /*�*j*/                                    /*�*populate the tower of Hanoi spindles.*/

call showTowers;   call mov 1,3,N;   say
say 'The minimum number of moves to solve a '        N"-disk  Tower of Hanoi is "      z
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dsk: parse arg from dest;   newV6= newV6 + 1;       pp=
if from==1  then do;  pp= overlay(bl,  pp, c.1)
pp= overlay(bar, pp, c.1+1, c.dest-c.1-1, bar) || tr
end
if from==2  then do
if dest==1  then do;  pp= overlay(tl,  pp, c.1)
pp= overlay(bar, pp, c.1+1, c.2-c.1-1,bar)||br
end
if dest==3  then do;  pp= overlay(bl,  pp, c.2)
pp= overlay(bar, pp, c.2+1, c.3-c.2-1,bar)||tr
end
end
if from==3  then do;  pp= overlay(br,  pp, c.3)
pp= overlay(bar, pp, c.dest+1, c.3-c.dest-1, bar)
pp= overlay(tl,  pp, c.dest)
end
say translate(pp, downs, Bcorners || Tcorners || bar);     say overlay(moveK, pp, 1)
say translate(pp, verts, Tcorners || Bcorners || bar)
say translate(pp, downs, Tcorners || Bcorners || bar);     moveK= moveK - 1
newV2.from= newV2.from - 1;      newV2.dest= newV2.dest + 1;     newV4= newV2.from + 1;           newV5= newV2.dest
newV3.dest.newV5= newV3.from.newV4;    newV3.from.newV4= blanks;      call showTowers
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mov: if arg(3)==1  then      call dsk arg(1) arg(2)
else do;  call mov arg(1),              6 -arg(1) -arg(2),    arg(3) -1
call mov arg(1),              arg(2),               1
call mov 6 -arg(1) -arg(2),   arg(2),               arg(3) -1
end                 /*�* [↑]  The  MOV  subroutine is recursive,  */
return                                 /*�*it uses no variables, is uses BIFs instead*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showTowers: do j=N  by -1  for N; newV7=newV3.1.j newV3.2.j newV3.3.j;  if newV7\=''  then say newV7; end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Towers-of-Hanoi\towers-of-hanoi-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
