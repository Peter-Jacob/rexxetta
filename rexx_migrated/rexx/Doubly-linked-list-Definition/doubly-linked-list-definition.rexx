/*�*REXX program implements various List Manager functions  (see the documentation above).*/
call sy 'initializing the list.'            ;  call @init
call sy 'building list: Was it a cat I saw' ;  call @put "Was it a cat I saw"
call sy 'displaying list size.'             ;  say  "list size="@size()
call sy 'forward list'                      ;  call @show
call sy 'backward list'                     ;  call @show ,,-1
call sy 'showing 4th item'                  ;  call @show 4,1
call sy 'showing 5th & 6th items'           ;  call @show 5,2
call sy 'adding item before item 4: black'  ;  call @put "black",4
call sy 'showing list'                      ;  call @show
call sy 'adding to tail: there, in the ...' ;  call @put "there, in the shadows, stalking its prey (and next meal)."
call sy 'showing list'                      ;  call @show
call sy 'adding to head: Oy!'               ;  call @put  "Oy!",0
call sy 'showing list'                      ;  call @show
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
p:       return word(arg(1), 1)                  /*�*pick the first word out of many items*/
sy:      say;   say left('', 30) "───" arg(1) '───';              return
@init:   newV1.@=;    @adjust: newV1.@=space(newV1.@);   newV1.#=words(newV1.@);      return
@hasopt: arg o;                                                   return pos(o, opt)\==0
@size:   return newV1.#
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@del:    procedure expose newV1.;     arg k,m;          call @parms 'km'
newV2=subword(newV1.@, k, k-1)   subword(newV1.@, k+m)
newV1.@=newV2;                   call @adjust;                                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@get:    procedure expose newV1.;     arg k,m,dir,newV2
call @parms 'kmd'
do j=k  for m  by dir  while  j>0  &  j<=newV1.#
newV2=newV2 subword(newV1.@, j, 1)
end   /*�*j*/
return strip(newV2)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@parms:  arg opt                                 /*�*define a variable based on an option.*/
if @hasopt('k')  then k=min(newV1.#+1, max(1, p(k 1)))
if @hasopt('m')  then m=p(m 1)
if @hasopt('d')  then dir=p(dir 1);                                   return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@put:    procedure expose newV1.;     parse arg x,k;        k=p(k newV1.#+1);      call @parms 'k'
newV1.@=subword(newV1.@, 1, max(0, k-1))   x   subword(newV1.@, k);           call @adjust
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@show:   procedure expose newV1.;     parse arg k,m,dir;    if dir==-1  &  k==''   then k=newV1.#
m=p(m newV1.#);              call @parms 'kmd';    say @get(k,m, dir);    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Doubly-linked-list-Definition\doubly-linked-list-definition.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
