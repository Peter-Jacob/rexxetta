/*�*REXX program  encrypts  (and displays)  uppercased text  using  the  Vigenère  cypher.*/
newV1.1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
L=length(newV1.1)
do j=2  to L;                        jm=j-1;    q=newV1.jm
newV1.j=substr(q, 2, L - 1)left(q, 1)
end   /*�*j*/

cypher = space('WHOOP DE DOO    NO BIG DEAL HERE OR THERE', 0)
oMsg   = 'People solve problems by trial and error; judgement helps pick the trial.'
oMsgU  = oMsg;    upper oMsgU
cypher_= copies(cypher, length(oMsg) % length(cypher) )
say '   original text ='   oMsg
xMsg= Ncypher(oMsgU);        say '   cyphered text ='   xMsg
bMsg= Dcypher(xMsg) ;        say 're-cyphered text ='   bMsg
exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Ncypher:  parse arg x;    nMsg=;       newV2=1      /*�*unsupported char? ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓*/
do i=1  for length(x);   j=pos(substr(x,i,1), newV1.1);   if j==0  then iterate
nMsg=nMsg || substr(newV1.j, pos( substr( cypher_, newV2, 1), newV1.1), 1);     newV2=newV2+1
end   /*�*j*/
return nMsg
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Dcypher:  parse arg x;    dMsg=
do i=1  for length(x);   j=pos(substr(cypher_, i, 1),  newV1.1)
dMsg=dMsg || substr(newV1.1, pos( substr(x, i, 1), newV1.j),   1  )
end   /*�*j*/
return dMsg
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Vigen-re-cipher\vigen-re-cipher-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
