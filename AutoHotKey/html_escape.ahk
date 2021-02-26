; Escape von Text, es wird der aktuell markierte
; Text kopiert, escaped und mit <pre> Tags wieder eingefügt
^+#e::
	Send, ^c
  	ClipWait
  	ClipContent = %ClipBoard%

  	ClipContent:= StrReplace(ClipContent, "&", "&amp;")
  	ClipContent:= StrReplace(ClipContent, """", "&quot;")
  	ClipContent:= StrReplace(ClipContent, "<", "&lt;")
  	ClipContent:= StrReplace(ClipContent, ">", "&gt;")  	

  	ClipContent = <pre>`r`n%ClipContent%</pre>

  	Clipboard = %ClipContent%
	Send, ^v
Return