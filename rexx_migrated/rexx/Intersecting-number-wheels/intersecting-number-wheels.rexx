/*�*REXX program  expresses numbers  from  intersecting number wheels  (or wheel sets).   */
newV3.=                                              /*�*initialize array to hold the wheels. */
parse arg lim newV3.1                                /*�*obtain optional arguments from the CL*/
if lim='' | lim=","  then lim= 20                /*�*Not specified?  Then use the default.*/
if newV3.1='' | newV3.1=","  then do;  newV3.1= ' A:  1 2 3 '
newV3.2= ' A:  1 B 2,    B:  3 4 '
newV3.3= ' A:  1 D D,    D:  6 7 8 '
newV3.4= ' A:  1 B C,    B:  3 4,    C:  5 B '
end
do i=1  while newV3.i\='';  call run          /*�*construct wheel set and "execute" it.*/
end   /*�*i*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
error: procedure; say;  say;    say '***error***'   arg(1);          say;   say;   exit 12
isLet: procedure; parse arg y;  return datatype(y, 'M') & length(y)==1   /*�*is a letter? */
isNum: procedure; parse arg y;  return datatype(y, 'N')                  /*�*is a number? */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
run: @wn= 'wheel name';     first=;      newV1= "wheel name not followed by a colon:"
newV2= 'gear name' ;     gear.=;      say copies("═", 79)
say 'building wheel group for: '    newV3.i;    wheels= space(newV3.i);        upper wheels
do newV5=1  while wheels\='';  parse var wheels  w gears "," wheels;    L= length(w)
if L==2  then do;  newV4.newV5= left(w, 1)       /*�*obtain the one─character gear name.  */
if right(w, 1)\==':'  then call error newV1  w
if \isLet(newV4.newV5)        then call error @wn "not a letter:"  w
end
else call error "first token isn't a"   @wn':'     w
if newV5==1  then first= newV4.1                 /*�*Is this is the 1st wheel set?  Use it*/
if first==''  then call error "no wheel name was specified."
n= newV4.newV5                                   /*�*obtain the name of the 1st wheel set.*/
gear.n.0= 1                              /*�*initialize default 1st gear position.*/
say '   setting gear.name:'     n     "    gears=" gears
do g=1  for words(gears);         newV6= word(gears, g)
if isNum(newV6)  |  isLet(newV6)  then do;  gear.n.g= newV6;  iterate;  end
call error  newV2  "isn't a number or a gear name:"  newV6
end   /*�*g*/
end      /*�*#*/
say;                  say center(' running the wheel named '  first" ", 79, '─');   newV7=
do dummy=0  by 0  until words(newV7)==lim;           n= first
z= gear.n.0;               x= gear.n.z;          z= z + 1
gear.n.0= z;      if gear.n.z==''  then gear.n.0= 1
if isNum(x)  then do;     newV7= newV7 x;    iterate;    end   /*�*found a number, use it.*/
xx= x                                    /*�*different gear, keep switching 'til X*/
do forever;            nn= xx
if gear.nn.0==''  then call error "a gear is using an unknown gear name:"  x
zz= gear.nn.0;         xx= gear.nn.zz
zz= zz + 1;   gear.nn.0= zz;   if gear.nn.zz==''  then gear.nn.0= 1
if isNum(xx)  then do;  newV7= newV7 xx;  iterate dummy;  end
end   /*�*forever*/                     /*�* [↑]  found a number,  now use FIRST.*/
end      /*�*dummy*/                       /*�*"DUMMY"  is needed for the  ITERATE. */
say '('lim "results): "  strip(newV7);      say;          say;          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Intersecting-number-wheels\intersecting-number-wheels.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
