; Generierung eines HTML-Links, die Markierung wird in die Zwischenablage
; kopiert in einer InputBox kann der Anwender anschlieﬂend einen Link eingeben
^+#l::
	Url = %Clipboard%
	Send, ^c
	ClipWait
	LinkText = %Clipboard%
	InputBox,  Url , Link, Enter the link input, , , , , , , , %Url%

	Gui, New
	Gui, Add, Text,, Target
	Gui, Add, Listbox, r3 vTarget AltSubmit, -|_blank
	Gui, Add, Text,, Rel
	Gui, Add, Listbox, r3 vRel AltSubmit, -|nofollow
	Gui, Add, Button, Default gTargetComplete, &OK
	Gui, Show
	Send {Down}
	Send {Down}
	Return

	TargetComplete:
	Gui, Cancel

	GuiControlGet, Target
	selectedTarget:= Target

	GuiControlGet, Rel
	selectedRel:= Rel	

	LinkHtml = <a href="%Url%"

	if (selectedTarget = 2)
	{
		LinkHtml = %LinkHtml% target="_blank"
	}

	if (selectedRel = 2)
	{
		LinkHtml = %LinkHtml% rel="nofollow" 	
	}

	LinkHtml = %LinkHtml%>%LinkText%</a>

	SendInput, %LinkHtml%
return

