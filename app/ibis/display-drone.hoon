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
  ?:  |((~(has by args) 'action') (~(has by args) 'ind'))
    [%add ~]
  'fail - this is a brief containing a cord'
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@t])
      ==
  ~&  odo
  ^-  reply:rudder
  |^  [%page page]
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
          ;p:"ha"
      ==
    ==
  ::
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    
    /*  test  */
    '''
  --
--