/*�*REXX program to  read/interpret  UPC  symbols and translate them to a numberic string.*/
newV2.0= '   ## #'
newV2.1= '  ##  #'
newV2.2= '  #  ##'
newV2.3= ' #### #'
newV2.4= ' #   ##'
newV2.5= ' ##   #'
newV2.6= ' # ####'
newV2.7= ' ### ##'
newV2.8= ' ## ###'                                /*�* [↓]  right─sided UPC digits.*/
newV2.9= '   # ##' ;        do i=0  for 10;     newV1.i= translate(newV2.i, ' #', "# ")
end  /*�*i*/
say center('UPC', 14, "─")     '   ---'copies(1234567, 6)"-----"copies(1234567, 6)'---'
newV3.=.
newV3.1 = '           # #   # ##  #  ## #   ## ### ## ### ## #### # # # ## ##  #   #  ##  ## ###  # ##  ## ### #  # #         '
newV3.2 = '          # # #   ##   ## # #### #   # ## #   ## #   ## # # # ###  # ###  ##  ## ###  # #  ### ###  # # #         '
newV3.3 = '           # #    # # #  ###  #   #    # #  #   #    # # # # ## #   ## #   ## #   ##   # # #### ### ## # #         '
newV3.4 = '         # # ##  ## ##  ##   #  #   #  # ###  # ##  ## # # #   ## ##  #  ### ## ## #   # #### ## #   # #         '
newV3.5 = '           # # ### ## #   ## ## ###  ##  # ##   #   # ## # # ### #  ## ##  #    # ### #  ## ##  #      # #         '
newV3.6 = '            # #  #   # ##  ##  #   #   #  # ##  ##  #   # # # # #### #  ##  # #### #### # #  ##  # #### # #         '
newV3.7 = '           # #  #  ##  ##  # #   ## ##   # ### ## ##   # # # #  #   #   #  #  ### # #    ###  # #  #   # #         '
newV3.8 = '          # # #    # ##  ##   #  # ##  ##  ### #   #  # # # ### ## ## ### ## ### ### ## #  ##  ### ## # #         '
newV3.9 = '           # # ### ##   ## # # #### #   ## # #### # #### # # #   #  # ###  #    # ###  # #    # ###  # # #          '
newV3.10= '          # # # #### ##   # #### # #   ## ## ### #### # # # #  ### # ###  ###  # # ###  #    # #  ### #          '
ends= '# #'                                        /*�*define ENDS literal const*/
do j=1  while newV3.j\==.;        newV5= newV3.j
txt=                                                      /*�*initialize  TXT  variable*/
if left(newV5, 9)\=''     | right(newV5, 9)\=''      then txt= 'bad blanks'
newV5= strip(newV5);   newV4= newV5                                      /*�*elide blanks at ends of $*/
L= length(newV5)                                              /*�*obtain length of $ string*/
if left(newV5, 3) \==ends | right(newV5, 3) \==ends  then txt= 'bad fence'
if L \== 95           & txt==''              then txt= 'bad length'
newV5= substr(newV5, 4, L - length(ends)*2)                                  /*�*elide "ends". */
newV5= delstr(newV5, length(newV5) % 2 - 1,  5)                                  /*�*  "   middle. */
sum= 0                                                               /*�*initialize SUM*/
if txt==''  then do k=1  for 12;     parse var  newV5   x  +7  newV5         /*�*get UPC digit.*/
do d=0  for 10;  if x==newV2.d | x==newV1.d  then leave /*�*valid digit?  */
end   /*�*d*/
if d==10 & k \==12  then do;   txt= 'reversed' ;   leave;   end
if d==10            then do;   txt= 'bad digit';   leave;   end
if k // 2  then sum= sum +    d * 3                 /*�*mult. by  3.  */
else sum= sum +    d                     /*�*  "    "  1.  */
txt= txt  ||  d
end     /*�*k*/

if left(txt,1)\=="b"  then if sum//10\==0  then txt= 'bad checksum'  /*�*invalid sum?  */
say center( strip(txt), 15)  ' '   newV4         /*�*show chksum (or err msg) with the UPC*/
end   /*�*j*/                                   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\UPC\upc.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
