say ggx1('4.0 0.0 6.0 10.0 0.0 3.0 10.0 7.0')
say ggx1('0.0 0.0 0.0 10.0 0.0 3.0 10.0 7.0')
say ggx1('0.0 0.0 0.0 10.0 0.0 3.0 10.0 7.0')
say ggx1('0.0 0.0 0.0  1.0 1.0 0.0  1.0 7.0')
say ggx1('0.0 0.0 0.0  0.0 0.0 3.0 10.0 7.0')
say ggx1('0.0 0.0 3.0  3.0 0.0 0.0  6.0 6.0')
say ggx1('0.0 0.0 3.0  3.0 0.0 1.0  6.0 7.0')
Exit

ggx1: Procedure
/*ª*---------------------------------------------------------------------
* find the intersection of the lines AB and CD
*--------------------------------------------------------------------*/
Parse Arg xa  ya  xb  yb   xc  yc  xd   yd
Say 'A=('xa'/'ya') B=('||xb'/'yb') C=('||xc'/'yc') D=('||xd'/'yd')'
res=''
If xa=xb Then Do                    /*ª* AB is a vertical line         */
k1='*'                            /*ª* slope is infinite             */
x1=xa                             /*ª* intersection's x is xa        */
If ya=yb Then                     /*ª* coordinates are equal         */
res='Points A and B are identical' /*ª* special case               */
End
Else Do                             /*ª* AB is not a vertical line     */
k1=(yb-ya)/(xb-xa)                /*ª* compute the slope of AB       */
d1=ya-k1*xa                /*ª* and its intersection with the y-axis */
End
If xc=xd Then Do                    /*ª* CD is a vertical line         */
k2='*'                            /*ª* slope is infinite             */
x2=xc                             /*ª* intersection's x is xc        */
If yc=yd Then                     /*ª* coordinates are equal         */
res='Points C and D are identical' /*ª* special case               */
End
Else Do                             /*ª* CD is not a vertical line     */
k2=(yd-yc)/(xd-xc)                /*ª* compute the slope of CD       */
d2=yc-k2*xc                /*ª* and its intersection with the y-axis */
End

If res='' Then Do                   /*ª* no special case so far        */
If k1='*' Then Do                 /*ª* AB is vertical                */
If k2='*' Then Do               /*ª* CD is vertical                */
If x1=x2 Then                 /*ª* and they are identical        */
res='Lines AB and CD are identical'
Else                          /*ª* not identical                 */
res='Lines AB and CD are parallel'
End
Else Do
x=x1                          /*ª* x is taken from AB            */
y=k2*x+d2                     /*ª* y is computed from CD         */
End
End
Else Do                           /*ª* AB is not verical             */
If k2='*' Then Do               /*ª* CD is vertical                */
x=x2                          /*ª* x is taken from CD            */
y=k1*x+d1                     /*ª* y is computed from AB         */
End
Else Do                         /*ª* AB and CD are not vertical    */
If k1=k2 Then Do              /*ª* identical slope               */
If d1=d2 Then               /*ª* same intersection with x=0    */
res='Lines AB and CD are identical'
Else                        /*ª* otherwise                     */
res='Lines AB and CD are parallel'
End
Else Do                       /*ª* finally the normal case       */
x=(d2-d1)/(k1-k2)           /*ª* compute x                     */
y=k1*x+d1                   /*ª* and y                         */
End
End
End
End
If res='' Then                    /*ª* not any special case          */
res='Intersection is ('||x'/'y')'  /*ª* that's the result          */
Return '  -->' res
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-the-intersection-of-two-lines\find-the-intersection-of-two-lines-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
