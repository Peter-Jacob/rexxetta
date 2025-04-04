/*ͺ*REXX program  (state name puzzle)  rearranges two state's names βββΊ two new states.   */
newV7='Alabama,  Alaska, Arizona,  Arkansas, California,    Colorado, Connecticut,       Delaware, Florida, Georgia,',
'Hawaii,   Idaho,  Illinois, Indiana,  Iowa, Kansas,  Kentucky, Louisiana,  Maine, Maryland, Massachusetts,   ',
'Michigan, Minnesota, Mississippi, Missouri, Montana, Nebraska, Nevada, New Hampshire, New Jersey, New Mexico,',
'New York, North Carolina,  North Dakota,  Ohio, Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina,',
'South Dakota,  Tennessee,  Texas,  Utah,  Vermont,   Virginia, Washington, West Virginia, Wisconsin,  Wyoming'
parse arg xtra;    newV7=newV7 ',' xtra                     /*ͺ*add optional  (fictitious)  names.*/
newV1= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';     newV7=space(newV7) /*ͺ*!: the state list, no extra blanks*/
deads=0;    dups=0;    L.=0;     newV2=newV7;      newV3.= /*ͺ*initialize some REXX variables.   */
z=0                                                 /*ͺ* [β]  elide  dendβend (DE) states.*/
do de=0  for 2;              newV7=newV2            /*ͺ*use original state list for each. */
newV5.=
do states=0  by 0  until newV7==''              /*ͺ*parse until the cows come home.   */
parse var newV7  x  ','  newV7;       x=space(x)    /*ͺ*remove all blanks from state name.*/
if newV5.x\==''  then do                        /*ͺ*was state was already specified?  */
if de  then iterate       /*ͺ*don't tell error if doing 2nd pass*/
dups=dups + 1             /*ͺ*bump the duplicate counter.       */
say 'ignoring the 2nd naming of the state: '    x;      iterate
end
newV5.x=x                                       /*ͺ*indicate this state name exists.  */
y=space(x,0);    upper y;    yLen=length(y) /*ͺ*get upper name with no spaces; Len*/
if de  then do                              /*ͺ*Is the firstt pass?  Then process.*/
do j=1  for yLen           /*ͺ*see if it's a deadβend state name.*/
newV8=substr(y, j, 1)          /*ͺ* _:  is some state name character.*/
if L.newV8 \== 1  then iterate /*ͺ*Count Β¬ 1?  Then state name is OK.*/
say 'removing deadβend state  [which has the letter '   newV8"]: "  x
deads=deads + 1            /*ͺ*bump number of deadβends states.  */
iterate states             /*ͺ*go and process another state name.*/
end   /*ͺ*j*/
z=z+1                           /*ͺ*bump counter of the state names.  */
newV6.z=y;  newV4.z=x                  /*ͺ*assign state name;  also original.*/
end
else do k=1  for yLen                /*ͺ*inventorize letters of state name.*/
newV8=substr(y,k,1);   L.newV8=L.newV8 + 1  /*ͺ*count each letter in state name.  */
end   /*ͺ*k*/
end   /*ͺ*states*/                            /*ͺ*the index STATES isn't incremented*/
end       /*ͺ*de*/
call list                                           /*ͺ*list state names in order given.  */
say z     'state name's(z)                "are useable."
if dups \==0  then say dups  'duplicate of a state's(dups)   'ignored.'
if deads\==0  then say deads 'deadβend state's(deads)        'deleted.'
sols=0                                              /*ͺ*number of solutions found (so far)*/
say                                                 /*ͺ*[β]  look for mix and match states*/
do j=1  for z     /*ͺ* ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ  */
do k=j+1  to z                               /*ͺ* ββββ state K,  state J  βΊββββββ  */
if newV6.j<<newV6.k  then JK=newV6.j || newV6.k              /*ͺ*is the state in the proper order? */
else JK=newV6.k || newV6.j              /*ͺ*No,  then use the new state name. */
do m=1  for z; if m==j | m==k then iterate /*ͺ*no state  overlaps  are allowed.  */
if verify(newV6.m, jk) \== 0      then iterate /*ͺ*is this state name even possible? */
nJK=elider(JK, newV6.m)                        /*ͺ*a new JK, after eliding #.m chars.*/
do n=m+1  to z; if n==j | n==k then iterate      /*ͺ*no overlaps are allowed.  */
if verify(newV6.n, nJK) \== 0      then iterate      /*ͺ*is it possible?           */
if elider(nJK, newV6.n) \== ''     then iterate      /*ͺ*any leftovers letters?    */
if newV6.m<<newV6.n  then MN=newV6.m || newV6.n                  /*ͺ*is it in the proper order?*/
else MN=newV6.n || newV6.m                  /*ͺ*we found a new state name.*/
if newV3.JK.MN\=='' | newV3.MN.JK\==""  then iterate   /*ͺ*was it done before?       */
say 'found: '      newV4.j','     newV4.k       "  ββββΊ  "        newV4.m','      newV4.n
newV3.JK.MN=1                            /*ͺ*indicate this solution as being found*/
sols=sols+1                           /*ͺ*bump the number of solutions found.  */
end   /*ͺ*n*/
end     /*ͺ*m*/
end       /*ͺ*k*/
end         /*ͺ*j*/
say                                              /*ͺ*show a blank line for easier reading.*/
if sols==0  then sols= 'No'                      /*ͺ*use mucher gooder (sic) Englishings. */
say sols  'solution's(sols)    "found."          /*ͺ*display the number of solutions found*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
elider: parse arg hay,pins                       /*ͺ*remove letters (pins) from haystack. */
do e=1  for length(pins);    p=pos( substr( pins, e, 1),  hay)
if p==0  then iterate   ;    hay=overlay(' ', hay, p)
end   /*ͺ*e*/          /*ͺ* [β]  remove a letter from haystack. */
return space(hay, 0)                     /*ͺ*remove blanks from the haystack.     */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
list:   say;   do i=1  for z;   say right(i, 9)   newV4.i;   end;            say;      return
s:      if arg(1)==1  then return arg(3);    return word(arg(2) 's', 1)    /*ͺ*pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\State-name-puzzle\state-name-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
