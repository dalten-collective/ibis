/-  store=graph-store, *resource
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
+$  flock  (jug resource [ind=index:store [url=@t luv=@ud]])
::
::  actions
::
+$  wade
  $%  [%nest res=resource pat=path bak=@ux pub=?]
      [%move res=resource pat=path]
      [%tint res=resource bak=@ux]
      [%feed res=resource ~]
      [%jump res=resource ~]
      fish
      [%add ~]
  ==
::
::  fish - only increment a love :)
::
+$  fish
  $%  [%love ind=index:store]
  ==
--