/*�*REXX program  encrypts  (and displays)  most text  using  the  Vigenère  cypher.      */
newV2= 'abcdefghijklmnopqrstuvwxyz';       newV1=newV2;    upper newV1
newV3.1 = newV1 || newV2'0123456789~`!@#$%^&*()_-+={}|[]\:;<>?,./" '''
L=length(newV3.1)
do j=2  to length(newV3.1);                jm=j - 1;          q=newV3.jm
newV3.j=substr(q, 2, L - 1)left(q, 1)
end   /*�*j*/

cypher = space('WHOOP DE DOO    NO BIG DEAL HERE OR THERE', 0)
oMsg   = 'Making things easy is just knowing the shortcuts. --- Gerard J. Schildberger'
cypher_= copies(cypher, length(oMsg) % length(cypher) )
say '   original text ='   oMsg
xMsg= Ncypher(oMsg);         say '   cyphered text ='   xMsg
bMsg= Dcypher(xMsg);         say 're-cyphered text ='   bMsg
exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Ncypher:  parse arg x;    nMsg=;       newV4=1      /*�*unsupported char? ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/
do i=1  for length(x);   j=pos(substr(x,i,1), newV3.1);   if j==0  then iterate
nMsg=nMsg || substr(newV3.j, pos( substr( cypher_, newV4, 1), newV3.1), 1);     newV4=newV4 + 1
end   /*�*j*/
return nMsg
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Dcypher:  parse arg x;    dMsg=
do i=1  for length(x);   j=pos(substr(cypher_, i, 1),  newV3.1)
dMsg=dMsg || substr(newV3.1, pos( substr(x, i, 1), newV3.j),   1  )
end   /*�*j*/
return dMsg
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Vigen-re-cipher\vigen-re-cipher-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
