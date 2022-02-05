::
::  ibis app file
::
::  ibis creates public-facing galleries from Urbit graph-store collections and
::  records social interactions from the clear web against the posts you serve.
::
::  ibis provides a control plane that allows the proprietor to see their 
/-  *ibis, store=graph-store, *resource
/+  default-agent, dbug, rudder, server
/~  plane  (page:rudder state-zero wade)  /app/ibis/control
/~  drone  (page:rudder state-zero fish)  /app/ibis/gallery
|%
+$  versioned-state
  $%  state-0
  ==
::
+$  state-0
  $:  %0
      state-zero
  ==
::
+$  card     card:agent:gall
+$  eyre-id  @ta
--
::
%-  agent:dbug
::
=|  state-0
=*  state  -
::
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc   ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  [%expo %start ~]
  =+  [[~ [%apps %ibis ~]] dap.bowl]
  :_  this
  :~  [%pass /eyre/connect %arvo %e %connect -]
      [%pass /ibis/graph/keys %agent [our.bowl %graph-store] %watch [%keys ~]]
  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  =/  old=versioned-state  !<(versioned-state ole)
  =+  cards=*(list card)
  =?    cards
      =+  kez=(~(get by wex.bowl) [/ibis/graph/keys our.bowl %graph-store])
      ?~(kez %.y !(-.u.kez))
    :_  cards
    [%pass /ibis/graph/keys %agent [our.bowl %graph-store] %watch [%keys ~]]
  [cards this(state old)]
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  `this
      %handle-http-request
    ::  we don't want to expose wade to the general public
    ::  nor fish to the admin, so we first differentiate based
    ::  on request and then do the rudder behaviors.
    =+  htp=!<([=eyre-id =inbound-request:eyre] vase)
    =/  perm=[[ext=(unit @ta) sav=(list @t)] args=(list [key=@t value=@t])]
      (parse-request-line:server url.request.inbound-request.htp)
    ?:  ?|  ?=([%apps %ibis ~] sav.perm)
            ?=([%apps %ibis %$ ~] sav.perm)
            ?=([%apps %ibis %index ~] sav.perm)
        ==
      ::
      ::  admin - look for gallery for the if-false case
      ::
      =;  out=(quip card _flock)
        [-.out this(state [%0 +.out])]
      %.  [bowl !<(order:rudder vase) state-zero]
      %:  (steer:rudder state-zero wade)
        plane
      ::
        |=  =trail:rudder
        ^-  (unit place:rudder)
        ?~  site=(decap:rudder /apps/ibis site.trail)
          ~
        ?+  u.site  ~
          ~           `[%page & %plane]
          [%index ~]  `[%away (snip site.trail)]
        ==
      ::
        |=  =order:rudder
        ^-  [[(unit reply:rudder) (list card)] state-zero]
        =;  msg=@t  [[`[%code 404 msg] ~] +.state]
        %+  rap  3
        :~  'ibis page '  url.request.order  ' not found ~'   ==
      ::
        |=  wad=wade
        ^-  $@(@t [brief:rudder (list card) state-zero])
        'error'
        ::?-  -.wad
        ::  %nest  [~ ~ [pools catch flock]]::``+>:(nest:thoth:hc +.wadi)
        ::  %move  [~ ~ [pools catch flock]]::``+>:(move:thoth:hc +.wadi)
        ::  %tint  [~ ~ [pools catch flock]]::``+>:(tint:thoth:hc +.wadi)
        ::  %feed  [~ ~ [pools catch flock]]::``+>:(feed:thoth:hc +.wadi)
        ::  %jump  [~ ~ [pools catch flock]]::``+>:(jump:thoth:hc +.wadi)
        ::  %add   [~ ~ [pools catch flock]]::``+.state
        ::==
      ==
    ::
    ::  gallery - the second half from admin above
    ::
    ?>  ?=([%apps %ibis @ @ *] sav.perm)
    =/  ext=[@ @ p=@t q=@t *]  sav.perm
    =;  out=(quip card state-zero)
      [-.out this(state [%0 +.out])]
    %.  [bowl !<(order:rudder vase) state-zero]
    %:  (steer:rudder state-zero fish)
      drone
    ::
      |=  =trail:rudder
      ^-  (unit place:rudder)
      ::
      ?~  site=(decap:rudder /apps/ibis)
        ~
      ?+  u.site  ~
        [@ @ ~]         `[%page | %drone]
        [@ @ %$ ~]      `[%away (snip site.trail)]
        [@ @ %index ~]  `[%away (snip site.trail)]
      ==
    ::
      |=  =order:rudder
      ^-  [[(unit reply:rudder) (list card)] state-zero]
      =;  msg=@t  [[`[%code 404 msg] ~] +.state]
      %+  rap  3
      ['ibis page ' (url.request.order) ' not found ~' ~]
    ::
      |=  tad=fish
      ^-  $@(@t [brief:rudder (list card) state-zero])
      ?-    -.tad
          %love
        ?>  (~(has by catch) [(slav %p p.ext) (slav %p q.ext)])
        =/  poast=(map index:store [url=@t luv=@ud])
          %-  my
          ~(tap in (~(got by catch) [(slav %p p.ext) (slav %p q.ext)]))
        ?>  (~(has by poast) ind.tad)
        =/  prior=[url=@t luv=@ud]
          (~(got by poast) ind.tad)
        =-  ``[pools catch -]
        %+  ~(put ju flock)  [(slav %p p.ext) (slav %p q.ext)]
        [ind.tad url.prior +(luv.prior)]
      ==
    ==
  ::
      %ibis-wade
    ?>  (team:title our.bowl src.bowl)
    =^  cards  state
      (thoth:hc !<(wade vase))
    [cards this]
  ==
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card _this)
  ?-    -.sign
      %kick
    :_  this
    [[%pass /ibis/graph/keys %agent [our.bowl %graph-store] %watch [%keys ~]]]~
  ::
      %fact
    ~|  [%unexpected-fact p.cage.sign %for dap.bowl %from src.bowl]
    ?+    p.cage.sign  !!
        %graph-update-3
      =/  upd=update:store  !<(update:store q.cage.sign)
      ?>  ?=(%keys -.q.upd)
      =.  pools
        (~(rep in resources.q.upd) brood)
      `this
    ==
  ::
      %poke-ack
    ~&  >  [%ibis %got %poke-ack ~]
    ~&  >>  wire
    ~&  >>  sign
    `this
  ::
      %watch-ack
    ~&  >  [%ibis %got %watch-ack ~]
    ~&  >>  wire
    ~&  >>  sign
    `this
  ==
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%http-response *]
    ~&  >>  "I just handled an http-response"  ::EO debug
    `this
  ==
++  on-arvo   on-arvo:def
++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
::
|_  bol=bowl:gall
::
++  switch-leg
  |=  [[res=resource pat=path bak=@ux pub=?] out=(map path resource)]
  (~(put by out) pat res)
::
++  brood
  |=  [res=resource out=(set resource)]
  =/  pat=path
    :~  (scot %p our.bol)  %graph-store  (scot %da now.bol)
        %graph  (scot %p entity.res)  (scot %tas name.res)
        %mark  %noun
    ==
  =+  murk=.^((unit mark:store) %gx pat)
  ?~  murk
    out
  ?.  ?=(%graph-validator-link u.murk)
    out
  (~(put in out) res)
::
++  preen
  |_  pat=(map path resource)
  ++  plumage
    |=  [pat=path out=(unit place:rudder)]
    ~
  --
::
++  thoth
  |=  wadi=wade
  |^
  ?-  -.wadi
    %nest  (nest +.wadi)
    %move  (move +.wadi)
    %tint  (tint +.wadi)
    %feed  (feed +.wadi)
    %jump  (jump +.wadi)
    %add   `state
  ==
  ::
  ++  nest
    |=  [res=resource pat=path bak=@ux pub=?]
    ?:  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%resource %already %assigned ~]
      `state
    `state(catch (~(put by catch) res [pat bak pub]))
  ::
  ++  move
    |=  [res=resource pat=path]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    =+  (~(got by catch) res)
    `state(catch (~(put by catch) res [pat bak.- pub.-]))
  ::
  ++  tint
    |=  [res=resource bak=@ux]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    =+  (~(got by catch) res)
    `state(catch (~(put by catch) res [pat.- bak pub.-]))
  ::
  ++  feed
    |=  [res=resource ~]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    =+  (~(got by catch) res)
    `state(catch (~(put by catch) res [pat.- bak.- !pub.-]))
  ::
  ++  jump
    |=  [res=resource ~]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    `state(catch (~(del by catch) res))
  ::
  --
::
--