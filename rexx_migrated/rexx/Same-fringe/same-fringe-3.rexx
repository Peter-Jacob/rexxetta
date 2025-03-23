/*�*REXX pgm examines the leaves of 2 binary trees (as shown below), and finds inequities.*/
newV2= left('', 28);    say newV2   "        A                                       A     "
say newV2   "       / \    ◄════1st tree                    / \    "
say newV2   "      /   \                                   /   \   "
say newV2   "     /     \                                 /     \  "
say newV2   "    B       C                               B       C "
say newV2   "   / \     /              2nd tree════►    / \     /  "
say newV2   "  D   E   F                               D   E   F   "
say newV2   " /       / \                             /       / \  "
say newV2   "G       H   I                           G       δ   I " ; say
newV3= 0;     done.= 0;   newV1.= 0                      /*�*initialize:  # (leaves), DONE., nodes*/
do tnewV3=1  for 2;   call makenewV2tree  tnewV3;   end  /*�*define tree numbers  1  and  2.      */
z1= root.1;      L1= newV1.1.z1;    done.1.z1= 1     /*�*L1:    is a leaf on tree number  1.  */
z2= z1;          L2= newV1.2.z2;    done.2.z2= 1     /*�*L2:     " "   "   "   "     "    2.  */
do newV3%2                                        /*�*loop for the number of (tree) leaves.*/
if L1==L2  then do; if L1==0  then do; say  'The trees are equal.';    leave;  end
say 'The '     L1      " leaf is identical in both trees."
do until \done.1.z1;  z1=nxt(z1,1);  L1=newV1.1.z1; end;  done.1.z1=1
do until \done.2.z2;  z2=nxt(z2,2);  L2=newV1.2.z2; end;  done.2.z2=1
iterate
end
if L1==0   then say L2  'exceeds leaves in 1st tree'
if L2==0   then say L1  'exceeds leaves in 2nd tree'
say     'A difference is: '    L1    "¬="    L2;        leave
end   /*�*#%2*/
exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nxt: procedure expose newV1.;   arg q,t;        next= .          /*�*find next node in tree.  */
if newV1.t.q.newV2Lson\==0  &  newV1.t.q.newV2Lson.vis==0          then /*�*L branch & not visited ? */
do;  next=newV1.t.q.newV2Lson;  newV1.t.q.newV2Lson.vis=1;  end      /*�* ──►next node; Lside done*/
if next==. & newV1.t.q.newV2Rson\==0 & newV1.t.q.newV2Rson.vis==0  then /*�*R branch & not visited ? */
do;  next=newV1.t.q.newV2Rson;  newV1.t.q.newV2Rson.vis=1;  end      /*�* ──►next node; Rside done*/
if next==.  then next= newV1.t.q.newV2dad;     return next      /*�*father node; zero if done*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
makenewV2node: parse arg name,t;    newV3= newV3 + 1;    q= newV1.t.0 + 1 /*�*make new node/branch on tree*/
newV1.t.q= name;    newV1.t.q.newV2Lson= 0;   newV1.t.0= q
newV1.t.q.newV2dad= 0;  newV1.t.q.newV2Rson= 0;     return q   /*�*number of node just created.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
makenewV2tree: procedure expose newV1. root. newV3; parse arg tree    /*�*construct a couple of trees.*/
a= makenewV2node('A', tree);     root.tree= a;           hhh= substr('Hδ', tree, 1)
b= makenewV2node('B', tree);     call son 'L', b, a, tree
c= makenewV2node('C', tree);     call son 'R', c, a, tree
d= makenewV2node('D', tree);     call son 'L', d, b, tree
e= makenewV2node('E', tree);     call son 'R', e, b, tree
f= makenewV2node('F', tree);     call son 'L', f, c, tree
g= makenewV2node('G', tree);     call son 'L', g, d, tree
h= makenewV2node(hhh, tree);     call son 'L', h, f, tree  /*�*quacks like a duck? */
i= makenewV2node('I', tree);     call son 'R', i, f, tree;          return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
son: procedure expose newV1.;  parse arg newV4,son,dad,t;   LR= '_'newV4"SON";   newV1.t.son.newV2dad= dad
q= newV1.t.dad.LR;          if q\==0  then do;   newV1.t.q.newV2dad= son;   newV1.t.son.LR= q;    end
newV1.t.dad.LR= son;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Same-fringe\same-fringe-3.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
