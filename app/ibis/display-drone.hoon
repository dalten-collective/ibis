::
::  display drone for ibis
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
  =/  groe=path  [(scot %p our.bol) %graph-store (scot %da now.bol) ~]
  =/  mag=(map @t @t)  (malt args)
  ^-  reply:rudder
  |^
  ::  get resource
  =;  rus=(unit [res=resource start=(unit @da) prior=?])
    ?~  rus                        [%code 404 '%ibis error -> 404 - unknown destination page']
    =,  u.rus
    ?.  (~(has by catch.sat) res)  [%code 418 '%ibis error -> 418 - became teapot']
    ?.  ?=(~ start.u.rus)
      [%page (page res u.start.u.rus prior)]
    =;  fir=(unit time)
      ?~  fir                      [%code 404 '%ibis error -> 404 - no available poasts']
      [%page (page res u.fir %.n)]
    =-  ((unit time) .^(* %gx -))
    (welp groe [%update-log (scot %p entity.res) (scot %tas name.res) %latest %noun ~])
    ::
  ?~  (find "?" (trip url.request.odo))
    ?~  site=(decap:rudder /apps/ibis (stab url.request.odo))  ~
    ?+    u.site  ~
        [@ @ ~]
      `[[(slav %p -.u.site) (slav %tas +<.u.site)] ~ %.n]
    ==
  =-  ?~  p=-  ~ 
      :-  ~
      :+  [(slav %p (crip ->+<.u.p)) ->+>.u.p] 
        (slaw %da `@t`?~(a=(~(get by mag) 'start') ~ u.a))
      (~(has by mag) 'prior')
  %+  rush  url.request.odo
  ;~  pfix  fas
      ;~  (glue wut)  ;~((glue fas) (star alp) (star alp) (star ;~(pose sig alp)) sym)
          (star ;~(pose alp tis sig pam dot))
  ==  ==  
  ::
  ++  page
    |=  [res=resource start=time prior=?]
    ^-  manx
    ;html
      ;head
        ;title:"%ibis - {(scow %p -.res)} {(scow %tas +.res)}"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta
          =name     "viewport"
          =content  "width=device-width, initial-scale=1";
      ==
      ;body
        ;*  =/  hall=[boro=marl last=time]  (halls res start)
            ;=  ;div(class "full-container")
                  ;=  ;div(class "button-container")
                        ;=  ;+  ?.  prior  ;button(disabled ""):"< Previous"
                                ;button
                                  =value    "back"
                                  =onclick  "lastPage()"
                                  < Previous
                                ==
                            ;button
                              =value    "{<last.hall>}"
                              =onclick  "nextPage()"
                              Next >
                            ==
                        ==
                      ==
                      ;div(class "gallery-container")
                        ;*  boro.hall
                      ==
                  ==
                ==
                ;script:"{(script last.hall prior)}"
            ==
      ==
    ==
  ::
  ++  halls
    |=  [res=resource pag=time]
    |^
    ^-  [boro=marl last=time]
    =/  pata=path
      %+  welp  groe
      :^  %graph  (scot %p entity.res)  (scot %tas name.res)
      [%node %index %lone (scot %ud pag) %noun ~]
    =/  ponn=path
      %+  welp  groe
      :^  %graph  (scot %p entity.res)  (scot %tas name.res)
      [%depth-first (scot %ud 8) (scot %ud pag) %graph-update-3 ~]
    %-  %~  rep  by
    %-  ~(uni by (frames .^(update:store %gx pata)))
    (frames .^(update:store %gx ponn))
    |=  [[tim=time url=@t] out=[boro=marl last=time]]
    :_  ?:(|(=(~2000.1.1 last.out) (lth tim last.out)) tim last.out)
    :_  boro.out
    ;div(class "frame", id "frame-{(scow %da tim)}")
      ;div(class "canvas", id "canvas-{(scow %da tim)}")
        ;img
          =class  "picture"
          =src    (trip url)
          =alt    "{(scow %tas name.res)}-{(scow %da tim)}";
      ==
    ==
    ::
    ++  frames
      |=  [tim=time tac=action:store]
      ^-  (map time @t)
      =|  out=(map time @t)
      ?+  -.tac  out
          %add-nodes  
        =/  vangogh=(map time @t)
          (~(rep by nodes.tac) murmur)
        (~(uni by out) vangogh)
      ::
          %add-graph
        %-  ~(rep by graph.tac)
        |=  $:  [at=atom no=node:store]
                out=(map time @t)
            ==
        ?.  ?=(%.y -.post.no)
          out
        =/  piet=index:store
          index.p.post.no
        =/  mondrian=(list content:store)
          contents.p.post.no
        |-
        ?:  |(?=(~ piet) ?=(~ mondrian))
          out
        ?+    -.i.mondrian
          $(piet ?~(t.piet piet t.piet), mondrian t.mondrian)
        ::
            %url
          %=  $
            piet      ?~(t.piet piet t.piet)
            mondrian  t.mondrian
            out       (~(put by out) i.piet url.i.mondrian)
          ==
        ==
      ::
          %remove-posts
        =/  gauguin=(list index:store)  ~(tap in indices.tac)
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
      ?+    -.i.warhol
        $(ind ?~(t.ind ind t.ind), warhol t.warhol)
      ::
          %url
        %=  $
          warhol  t.warhol
          ind     ?~(t.ind ind t.ind)
          out     (~(put by out) i.ind url.i.warhol)
        ==
      ==
    -- 
  ::
  ++  script
    |=  [a=time b=?]
    """
    function nextPage() \{
      var url = window.location.href;
      var spl = url.split('?');
      var par = spl[0].concat({<(trip (rap 3 :~('?start=' (scot %da a) '&prior=' 'yes')))>});
      console.log(par);
      window.location = par;
    }

    function lastPage() \{
      history.back()
    }
    """
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }

    /*  full  */
    .full-container {
      width: 95vw;
      padding: 15px 0;
      display: flex;
      flex-direction: column;
      margin: 0 auto;
    }

    /*  buttons  */
    .button-container {
      width: 90vw;
      padding: 20px 0;
      display: flex;
      justify-content: space-between;
      margin: 0 auto;
    }

    /*  gallery  */
    .gallery-container {
      width: 90vw;
      padding: 20px 0;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      margin: 0 auto;
    }
    .frame {
      margin-bottom: 10px;
    }
    .canvas {
      text-align: center;
    }
    .picture {
      max-width: 300px;
      max-height: 300px;
      object-fit: contain;
    }

    .luv-multi {
      position: relative;
    }
    '''
  --
--