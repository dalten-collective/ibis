::
::  control plane for ibis
::
/-  *ibis, store=graph-store, *resource
/+  rudder
::
^-  (page:rudder state-zero wade)
::
|_  $:  bol=bowl:gall
        odo=order:rudder
        sat=state-zero
    ==
::
++  final  (alert:rudder 'ibis' build)
::
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder wade)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ::  for valid requests, we produce the appropriate action.
  ::
  ?.  ?|  (~(has by args) 'action')
          (~(has by args) 'action-tint')
          (~(has by args) 'action-feed')
          (~(has by args) 'action-jump')
      ==
    '%ibis error -> unspecified POST action'
  =/  act=@t
    ?~  (~(get by args) 'action')
      ?~  (~(get by args) 'action-tint')
        ?~  (~(get by args) 'action-feed')
          (~(got by args) 'action-jump')
        (~(got by args) 'action-feed')
      (~(got by args) 'action-tint')
    (~(got by args) 'action')
  ::
  ?>    authenticated.odo
  ?+    act  (cat 3 '%ibis error ->  invalid POST method %' act)
  ::
      %nest
    ?.  ?&((~(has by args) 'res') (~(has by args) 'bak'))
      %+  rap  3
      ~['%ibis error -> %' act ' requires all fields']
    ::::
    ::  parse resource
    =/  rus=(unit [sap=tape loc=@tas])
      %+  rush  (~(got by args) 'res')
      ;~((glue bar) (star ;~(pose sig alp)) sym)
    ?~  rus  '%ibis error -> invalid resource selection'
    =/  res=resource  [(slav %p (crip sap.u.rus)) loc.u.rus]
    ::::
    ::  parse color
    =/  buk=(unit @ux)
      (rush (~(got by args) 'bak') ;~(pfix hax hex))
    ?~  buk  '%ibis error -> invalid background color selection'
    =/  bak  `@ux`u.buk
    ::::
    ::  public is just available
    =+  pub=(~(has by args) 'pub')
    ::
    [%nest res bak pub]
  ::
      %tint
    ?.  ?&((~(has by args) 'res') (~(has by args) 'bak'))
      %+  rap  3
      ~['%ibis error -> %' act ' requires all fields']
    ::::
    ::  parse resource
    =/  rus=(unit [sap=tape loc=@tas])
      %+  rush  (~(got by args) 'res')
      (ifix [sel ser] ;~((glue ace) (star ;~(pose sig alp)) sym))
    ?~  rus  '%ibis error -> invalid resource selection'
    =/  res=resource  [(slav %p (crip sap.u.rus)) loc.u.rus]
    ::::
    ::  parse color
    =/  buk=(unit @ux)
      (rush (~(got by args) 'bak') ;~(pfix hax hex))
    ?~  buk  '%ibis error -> invalid background color selection'
    =/  bak  `@ux`u.buk
    ::
    ?.  (~(has by catch.sat) res)
      %+  rap  3 
      ~['%ibis error -> invalid post method %' act ' - invalid resource selection']
    ::
    [%tint res bak]
  ::
      %feed
    ?.  (~(has by args) 'res')
      %+  rap  3
      ~['%ibis error -> %' act ' requires all fields']
    ::::
    ::  parse resource
    =/  rus=(unit [sap=tape loc=@tas])
      %+  rush  (~(got by args) 'res')
      (ifix [sel ser] ;~((glue ace) (star ;~(pose sig alp)) sym))
    ?~  rus  '%ibis error -> invalid resource selection'
    =/  res=resource  [(slav %p (crip sap.u.rus)) loc.u.rus]
    ::
    ?.  (~(has by catch.sat) res)
      %+  rap  3 
      ~['%ibis error -> invalid post method %' act ' - invalid resource selection']
    ::
    [%feed res ~]
  ::
      %jump
    ?.  (~(has by args) 'res')
      %+  rap  3
      ~['%ibis error -> %' act ' requires all fields']
    ::::
    ::  parse resource
    =/  rus=(unit [sap=tape loc=@tas])
      %+  rush  (~(got by args) 'res')
      (ifix [sel ser] ;~((glue ace) (star ;~(pose sig alp)) sym))
    ?~  rus  '%ibis error -> invalid resource selection'
    =/  res=resource  [(slav %p (crip sap.u.rus)) loc.u.rus]
    ::
    ?.  (~(has by catch.sat) res)
      %+  rap  3 
      ~['%ibis error -> invalid post method %' act ' - invalid resource selection']
    ::
    [%jump res ~]
  ==
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@t])
      ==
  ^-  reply:rudder
  |^  [%page page]
  ::
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%ibis control plane"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
      ;body
        ;+  ?~  msg  :/""
            ?:  gud.u.msg
              ;div#status.green:"{(trip txt.u.msg)}"
            ;div#status.red:"{(trip txt.u.msg)}"
        ;*  ?.  =(~ catch.sat)
              `marl`(~(rep by catch.sat) make-stand)
            ;=  ;div(class "empty-stand-row");
            ==
        ;div(class "new-stand")
          ;form(method "post")
            ;div(class "new-stand-internals")
              ;select
                =name      "res"
                =required  ""
                ;option(value "", hidden ""):"Select A Resource"
                ;*  ?.  =(~ pools.sat)
                      `marl`(~(rep in pools.sat) make-drops)
                    ;=  ;option(value "", hidden ""):"Empty"
                    ==
              ==
              ;input
                =name   "bak"
                =type   "color"
                =value  "#363636";
              ;input
                =name     "pub"
                =type     "checkbox"
                =checked  "";
              ;input
                =name   "action"
                =type   "submit"
                =value  "nest";
            ==
          ==
        ==
      ==
    ==
  ::
  ++  make-drops
    |=  [res=resource out=marl]
    ^-  marl
    ?~  (~(has by catch.sat) res)
      out
    :_  out
    ;option
        =name  "resource"
        =value  "{(scow %p -.res)}|{(scow %tas +.res)}"
      ;div:"{(scow %p -.res)} {(scow %tas +.res)}"
    ==
  ++  make-stand
    |=  [[res=resource [bak=@ux pub=?]] out=marl]
    ^-  marl
    :_  [[[%br ~] ~] out]
    ;div(class "hav-stand")
      ;form(method "post")
        ;div(class "hav-stand-internals")
          ;input
            =name      "res"
            =type      "text"
            =required  ""
            =readonly  ""
            =value     "[{(scow %p entity.res)} {(scow %tas name.res)}]";
        ::
          ;input
            =name      "bak"
            =type      "color"
            =value     "#{(oust [2 1] (oust [0 2] (scow %ux bak)))}";
        ::
          ;+  ?.  pub
                ;input
                  =name      "pub"
                  =type      "checkbox"
                  =readonly  "";
              ;input
                =name      "pub"
                =type      "checkbox"
                =readonly  ""
                =checked   "";
        ::
          ;input
            =name   "action-tint"
            =type   "submit"
            =value  "tint";
        ::
          ;input
            =name   "action-feed"
            =type   "submit"
            =value  "feed";
        ::
          ;input
            =name   "action-jump"
            =type   "submit"
            =value  "jump";
        ==
      ==
    ==
  ::
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    
    /*  hav-stand  */
    /*  new-stand  */

    /*  hav-stand-internals  */
    /*  new-stand-internals  */
    '''
  ::
  --
--