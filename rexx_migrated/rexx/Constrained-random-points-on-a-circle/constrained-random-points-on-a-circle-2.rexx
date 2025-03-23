/*ª* REXX ---------------------------------------------------------------
* show 100 random points of an annulus with radius 10 to 15
* 18.06.2014 Walter Pachl 'derived/simplified' from REXX version 1
*--------------------------------------------------------------------*/
Parse Arg points low high scale . /*ª* allow parms from command line.*/
If points=='' Then  points=100    /*ª* number of points              */
If low==''    Then  low=10        /*ª* inner radius                  */
If high==''   Then  high=15       /*ª* outer radius                  */
If scale==''  Then  scale=2       /*ª* horizontal scaling            */
low2=low**2
high2=high**2
/*ª* first compute all possible points                               */
point.=0
Do x=-high To high
x2=x*x
Do y=-high To high
y2=y*y
s=x2+y2
If s>=low2 &s<=high2 Then Do
z=point.0+1
point.z=x y
point.0=z
End
End
End
plotchar='O'
line.=''
np=point.0                           /*ª* available points           */
Do j=1 To points                     /*ª* pick the needed points     */
r=random(1,np)
Parse Var point.r x y              /*ª* coordinates                */
line.y=overlay(plotchar,line.y,scale*(x+high)+1) /*ª* put into line*/
point.r=point.np                   /*ª* replace taken point by last*/
np=np-1                            /*ª* reduce available points    */
If np=0 Then Leave                 /*ª* all possible points taken  */
End
/*ª* now draw the picture                                              */
Do y=-high To high
Say line.y
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Constrained-random-points-on-a-circle\constrained-random-points-on-a-circle-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
