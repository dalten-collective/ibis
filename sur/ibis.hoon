/-  store=graph-store
::
::  %ibis sur file
::
|%
::
::  state
::
+$  state-zero
  $:  =pools
      =catch
      =flock
  ==
::
::  state items
::
+$  pools  (set resource)
+$  catch  (map resource [pat=path bak=@ux pub=?])
+$  flock  (jug resource [index:store reacts=@ud])
::
::  actions
::
+$  wade
  $%  [%nest res=resource pat=path bak=@ux pub=?]
      [%move res=resource pat=path]
      [%tint res=resource bak=@ux]
      [%jump res=resource ~]
      [%feed res=resource ~]
  ==

--