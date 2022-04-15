::
::  ibis app file
::
::  ibis creates public-facing galleries from Urbit graph-store collections and
::  records social interactions from the clear web against the posts you serve.
::
::  ibis provides a control plane that allows the proprietor to see their 
/-  *ibis, store=graph-store, *resource
/+  default-agent, dbug, rudder, server
/~  pages  (page:rudder state-zero wade)  /app/ibis
::
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
  ~&  >  [%ibis %start ~]
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
      ?~(kez %.y !-.u.kez)
    :_  cards
    [%pass /ibis/graph/keys %agent [our.bowl %graph-store] %watch [%keys ~]]
  [cards this(state old)]
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?+    mark  `this
      %handle-http-request
    =;  out=(quip card state-zero)
      [-.out this(state [%0 +.out])]
    %.  [bowl !<(order:rudder vase) +.state]
    %:  (steer:rudder state-zero wade)
      pages
    ::
      |=  =trail:rudder
      ^-  (unit place:rudder)
      ?~  site=(decap:rudder /apps/ibis site.trail)  ~
      ?+  u.site  ~
        ~           `[%page & %control-plane]
        [%$ ~]      `[%away /apps/ibis]
        [%index ~]  `[%away (snip site.trail)]
      ::
        [@ @ ~]     `[%page | %display-drone]
        [@ @ %$ ~]  `[%away (snip site.trail)]
      ==
    ::
      |=  =order:rudder
      ^-  [[(unit reply:rudder) (list card)] state-zero]
      =;  msg=@t  [[`[%code 404 msg] ~] +.state]
      (rap 3 ~['ibis page' url.request.order ' not found'])
    ::
      |=  act=wade
      ^-  $@(@t [brief:rudder (list card) state-zero])
      ?+  -.act  ``+>:(thoth:hc act)
        %love  ``+.state
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
      =.  pools  (~(rep in resources.q.upd) brood:hc)
      `this
    ==
  ::
      %poke-ack
    ::~&  >  [%ibis %got %poke-ack ~]
    ::~&  >>  wire  ::EO dbug
    ::~&  >>  sign  ::EO dbug
    `this
  ::
      %watch-ack
    ::~&  >  [%ibis %got %watch-ack ~]
    ::~&  >>  wire
    ::~&  >>  sign
    `this
  ==
++  on-watch
  |=  =path
  ^-  (quip card _this)
  ?+  path  (on-watch:def path)
      [%http-response *]
    `this
  ==
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+    wire  (on-arvo:def wire sign-arvo)
      [%eyre %connect ~]
    ?+    sign-arvo  (on-arvo:def wire sign-arvo)
        [%eyre %bound *]
      ~?  !accepted.sign-arvo  [dap.bowl [%eyre %bind %fail] binding.sign-arvo]
      `this
    ==
  ==

++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
::
|_  bol=bowl:gall
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
++  thoth
  |=  wadi=wade
  |^
  ?-  -.wadi
    %nest  (nest +.wadi)
    %tint  (tint +.wadi)
    %feed  (feed +.wadi)
    %jump  (jump +.wadi)
    %love  `state
  ==
  ::
  ++  nest
    |=  [res=resource bak=@ux pub=?]
    ?:  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%resource %already %assigned ~]
      `state
    `state(catch (~(put by catch) res [bak pub]))
  ::
  ++  tint
    |=  [res=resource bok=@ux]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    =+  (~(got by catch) res)
    `state(catch (~(put by catch) res [bok pub.-]))
  ::
  ++  feed
    |=  [res=resource ~]
    ?.  (~(has by catch) res)
      ~&  >>>  [%ibis %error ~]
      ~&  >>>  [%no %associations %for (scot %p entity.res) name.res]
      `state
    =+  (~(got by catch) res)
    `state(catch (~(put by catch) res [bak.- !pub.-]))
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