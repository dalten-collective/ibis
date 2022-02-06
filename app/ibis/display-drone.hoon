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
    'not-implemented'
  'fail - this is a brief containing a cord'
::
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@t])
      ==
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
        ;+  ?~  site=(decap:rudder /apps/ibis (stab url.request.odo))
              ;p:"%ibis error -> 404 - unknown destination page"
            =/  rus=(unit [sap=tape loc=@tas])
              %+  rush  (spat u.site)
              ;~(pfix fas ;~((glue fas) (star ;~(pose sig alp)) sym))
            ?~  rus
              ;p:"%ibis error -> 404 - unknown destination page"
            =/  res=resource
              [(slav %p (crip ['~' sap.u.rus])) loc.u.rus]
            ?.  (~(has by catch.sat) res)
              ;p:"%ibis error -> 404 - unknown destination page"
            ;div(class "gallery")
              ;*  `marl`(halls res)
            ==
      ==
    ==
  ::
  ++  halls
    |=  res=resource
    |^
    ^-  marl
    =/  pat=path
      :~  (scot %p our.bol)  %graph-store  (scot %da now.bol)
          %update-log  (scot %p entity.res)  (scot %tas name.res)
          %noun
      ==
    =/  log=(list [time logged-update:store])
      ~(tap by (update-log:store .^(* %gx pat)))
    =/  cog=(map time @t)
      (roll log frames)
    %-  ~(rep by cog)
    |=  [[tim=time url=@t] out=marl]
    :_  out
    ;div(class "frame", id "frame-{(scow %da tim)}")
      ;img(src (trip url), alt "{(scow %tas name.res)}-{(scow %da tim)}");
    ==
    ::
    ++  frames
      |=  [[tim=time lup=logged-update:store] out=(map time @t)]
      ?+  -.q.lup  out
          %add-nodes  
        =/  vangogh=(map time @t)  (~(rep by nodes.q.lup) murmur)
        (~(uni by out) vangogh)
      ::
          %remove-posts
        =/  gauguin=(list index:store)  ~(tap in indices.q.lup)
        |-
        ?~  gauguin
          out
        %+  roll  i.gauguin
        |=  [@ (map time @t)]
        ?.  (~(has by out) `time`+<-)
          out
        (~(del by out) `time`+<-)
      ==
    ::
    ++  murmur
      |=  [[ind=index:store nod=node:store] out=(map time @t)]
      ?.  ?=(%.y -.post.nod)
        out
      =/  tomato=post:store  p.post.nod
      =/  warhol=(list content:store)  contents.tomato
      |-
      ?:  |(?=(~ ind) ?=(~ warhol))
        out
      ?+    -.i.warhol  %=  $
                          ind     ?~(t.ind ind t.ind)
                          warhol  t.warhol
                        ==
      ::
          %url
        %=  $
          out     (~(put by out) i.ind url.i.warhol)
          ind     ?~(t.ind ind t.ind)
          warhol  t.warhol
        ==
      ==
    -- 
  ::
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }

    /*  gallery  */

    .frame {
      width:   200px;
      height:  200px;
    }
    '''
  --
--