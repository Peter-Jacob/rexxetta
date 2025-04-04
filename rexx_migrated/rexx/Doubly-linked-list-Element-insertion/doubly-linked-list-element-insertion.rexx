/*ͺ*REXX program that implements various   List Manager   functions.      */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
βββ                    Functions of the  List Manager                  βββ
β                                                                        β
β @init      βββ initializes the List.                                   β
β                                                                        β
β @size      βββ returns the size of the List  [could be  0  (zero)].    β
β                                                                        β
β @show      βββ shows (displays) the complete List.                     β
β @show k,1  βββ shows (displays) the  Kth  item.                        β
β @show k,m  βββ shows (displays)   M  items,  starting with  Kth  item. β
β @show ,,β1 βββ shows (displays) the complete List backwards.           β
β                                                                        β
β @get  k    βββ returns the  Kth  item.                                 β
β @get  k,m  βββ returns the  M  items  starting with the  Kth  item.    β
β                                                                        β
β @put  x    βββ adds the  X  items to the  end  (tail) of the List.     β
β @put  x,0  βββ adds the  X  items to the start (head) of the List.     β
β @put  x,k  βββ adds the  X  items to before of the  Kth  item.         β
β                                                                        β
β @del  k    βββ deletes the item  K.                                    β
β @del  k,m  βββ deletes the   M  items  starting with item  K.          β
βββ                                                                    βββ
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
call sy 'initializing the list.'           ; call @init
call sy 'building list: Was it a cat I saw'; call @put 'Was it a cat I saw'
call sy 'displaying list size.'            ; say 'list size='@size()
call sy 'forward list'                     ; call @show
call sy 'backward list'                    ; call @show ,,-1
call sy 'showing 4th item'                 ; call @show 4,1
call sy 'showing 6th & 6th items'          ; call @show 5,2
call sy 'adding item before item 4: black' ; call @put 'black',4
call sy 'showing list'                     ; call @show
call sy 'adding to tail: there, in the ...'; call @put 'there, in the shadows, stalking its prey (and next meal).'
call sy 'showing list'                     ; call @show
call sy 'adding to head: Oy!'              ; call @put  'Oy!',0
call sy 'showing list'                     ; call @show
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββsubroutinesβββββββββββββββββββββββββ*/
p:       return word(arg(1),1)
sy:      say; say left('',30) "βββ" arg(1) 'βββ'; return
@hasopt: arg o; return pos(o,opt)\==0
@size:   return newV1.#
@init:   newV1.@=''; newV1.#=0; return 0
@adjust: newV1.@=space(newV1.@); newV1.#=words(newV1.@); return 0

@parms:  arg opt
if @hasopt('k') then k=min(newV1.#+1,max(1,p(k 1)))
if @hasopt('m') then m=p(m 1)
if @hasopt('d') then dir=p(dir 1)
return

@show:   procedure expose newV1.;   parse arg k,m,dir
if dir==-1 & k=='' then k=newV1.#
m=p(m newV1.#);
call @parms 'kmd'
say @get(k,m,dir);
return 0

@get:    procedure expose newV1.;   arg k,m,dir,newV2
call @parms 'kmd'
do j=k for m by dir while j>0 & j<=newV1.#
newV2=newV2 subword(newV1.@,j,1)
end   /*ͺ*j*/
return strip(newV2)

@put:    procedure expose newV1.;   parse arg x,k
k=p(k newV1.#+1)
call @parms 'k'
newV1.@=subword(newV1.@,1,max(0,k-1)) x subword(newV1.@,k)
call @adjust
return 0

@del:    procedure expose newV1.;   arg k,m
call @parms 'km'
newV2=subword(newV1.@,k,k-1) subword(newV1.@,k+m)
newV1.@=newV2
call @adjust
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Doubly-linked-list-Element-insertion\doubly-linked-list-element-insertion.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
