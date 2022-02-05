::
::  control plane for ibis
::
/-  *ibis
/+  rudder
::
^-  (page:rudder state-zero fish)
::
|_  $:  bol=bowl:gall
        odo=order:rudder
        sat=state-zero
    ==
::  (in practice, it tends to be more stylistically sensible to put the
::   +argue and +final arms above the +build one, simply because rendering
::   logic, possibly with css and js code, can get rather large. for the
::   sake of pedagogy though, we write them in the order in which they get
::   called during normal use.)
::
::  +build gets called for every GET request for which routing resolves
::  to this page. it must produce a $reply containing the response.
::
++  build
  |=  $:  ::  these are the url query parameters from the request,
          ::  ie /page?key=value&etc
          ::
          args=(list [k=@t v=@t])
          ::  an optional status message, usually indicating the result
          ::  of processing a POST request.
          ::
          ::  rudder itself only fills this in if there was an "rmsg" key
          ::  among the url query parameters, as results from a %next $reply.
          ::  (if that is the case, it will not be included in :args above.)
          ::  however, it's also common to call +build from within +final,
          ::  especially in the failure case.
          ::
          msg=(unit [gud=? txt=@t])
      ==
  ::  +build must produce a $reply. most commonly, this will be a %page, but
  ::  you might also want %xtra headers, or specify a %full custom payload.
  ::
  ^-  reply:rudder
  ::  when testing +build (or +argue, for that matter), you might consider
  ::  stubbing in some data if the app doesn't yet provide any.
  ::  =.  enemies  ['little timmy' 'chaos' enemies]
  ::
  ::  the code that follows renders a bare-bones html document.
  ::  most of this isn't too important, but take care to notice the various
  ::  ;form elements we create. these will trigger +argue calls for this page.
  ::
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%ibis control plane"
        ;style:"{(trip style)}"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
      ==
      ;body
        ::  we take care to render the status message, if there is any
        ::
        ;+  ?~  msg  :/""
            ?:  gud.u.msg
              ;div#status.green:"{(trip txt.u.msg)}"
            ;div#status.red:"{(trip txt.u.msg)}"
        ::
        ::  display stands
        ::
        ;*  ;=  (~(rep by catch) make-stand)
            ==
        ::
        ::  new stand entry form
        ::
        ;div(class "new-stand")
          ;form(method "post")
            ;input(type "text", name "standin", placeholder "farter");
            ;input(type "submit", name "add", value "add");
          ==
        ==
      ==
    ==
  ::
  ++  make-stand
    |=  [[res=resource pat=path bak=@ux pub=?] out=marl]
    :_  out
    ;div(class "stand-row")
      ;div(class "stand-internals")
        ;div(class "res-wrapper")
          ;div(class "res-itself")
            ;p:"{<entity.res>} {(trip (scot %tas name.res))} \\/"
          ==
        ==
        ;div(class "parappa-wrapper")
          ;div(class "parappa-itself")
            ;p:"{<pat>}"
          ==
        ==
        ;div(class "color-wrapper")
          ;div(class "color-itself")
            ;p:"{<bak>}"
          ==
        ==
        ;div(class "feed-wrapper")
          ;div(class "feed-itself")
            ;p:"{<(trip (scot %ux bak))>}"
          ==
        ==
        ;div(class "jump-wrapper")
          ;div(class "jump-itself")
            ;+  ?:  pub
                  ;p:"Public"
                ;p:"Private"
          ==
        ==
      ==
    ==
  ::
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    /*  stand classes  */
    /*  stand-row  */
    /*  stand-internals  */
    /*  res-wrapper  */
    /*  res-itself  */
    /*  parappa-wrapper  */
    /*  parappa-itself  */
    /*  color-wrapper  */
    /*  color-itself  */
    /*  feed-wrapper  */
    /*  feed-itself  */
    /*  jump-wrapper  */
    /*  jump-itself  */
    '''
  --
::  +argue gets called for every POST request made to this page.
::  it must attempt to derive a user action from the request.
::
++  argue
  ::  it gets passed the full header-list and body. some use cases, such as
  ::  file uploading, might require both for retrieving the submitted data.
  ::  in our example case, we only need the simple form data from the body.
  ::
  |=  [headers=header-list:http body=(unit octs)]
  ::  +argue may not always succeed in deducing a valid user action from
  ::  the request. the input could be bogus, or the user might provide
  ::  illegal values of some kind. in that case, instead of producing
  ::  the user action, +argue may produce a $brief, which is simply
  ::  a ?(~ @t), containing an optional error message.
  ::
  ^-  $@(brief:rudder fish)
  ::  retrieving arguments from the body, in the simple form data case,
  ::  is made trivial by +frisk.
  ::
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ::  for valid requests, we produce the appropriate action.
  ::
  ?:  |((~(has by args) 'add') (~(has by args) 'standin'))
    :: a successful brief
    [%love ~]
  :: a brief containing a cord
  'fail - this is a brief containing a cord'
::  +final gets called after a POST request has been processed.
::  it must produce a $reply containing the response.
::
::  (note that the below implementation of +final is equivalent to:
::
::     ++  final  (alert:rudder 'page-example' build)
::
::   if you want the same behavior, you are encouraged to use that helper
::   function. the expanded implementation is provided purely for
::   pedagogical reasons.)
::
++  final  (alert:rudder 'plane' build)
  ::  a success flag and a brief get passed in. if +argue failed to produce
  ::  a user action, or +solve failed to process the action, the :success
  ::  flag will be set to %.n, and the :brief will always contain a cord.
  ::
  ::  (in case +argue or +solve did not produce a message, rudder will add
  ::   a generic one.)
  ::
  ::  if both +argue and +solve calls succeeded, the :success flag will be
  ::  set to %.y. the :brief may or may not contain a status message.
  ::
  ::|=  [success=? =brief:rudder]
  ::  +final must produce a $reply. most commonly, this will be the same
  ::  $reply produced by +build, but with a success or error message included.
  ::
  ::^-  reply:rudder
  ::  indeed, in the error case here, we simply re-render the page using
  ::  +build.
  ::
  ::?.  success  (build ~ `[| `@t`brief])
  ::  in the success case, it is often good ux to issue a 308 redirect,
  ::  telling the browser to re-navigate using a GET request. this prevents
  ::  a page reload from triggering the same POST request again.
  ::  a %next $reply does this for us, putting the specified cord into the
  ::  location header, and including the :brief (if any) in the url query
  ::  parameters.
  ::
  ::[%next 'page-example' brief]
--
::
::  fair winds to ye!
