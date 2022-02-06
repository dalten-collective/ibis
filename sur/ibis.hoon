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
+$  catch  (map resource [bak=@ux pub=?])
+$  flock  (jug resource [tim=time [url=@t luv=@ud]])
::
::  actions
::
+$  wade
  $%  [%nest res=resource bak=@ux pub=?]
      [%tint res=resource bak=@ux]
      [%feed res=resource ~]
      [%jump res=resource ~]
      fish
  ==
::
::  fish - only increment a love :)
::
+$  fish
  $%  [%love tim=time]
  ==
--