&& ======================================================================== &&
&& Class FoxStack
&& ======================================================================== &&
Define Class FoxStack As Custom
    Hidden oStack
    
    Function Init
    	this.oStack = CreateObject('Collection')
    EndFunc

    Function Push
        lParameters tvData As Variant
        Local lcType
        lcType = Type("tvData")
        If lcType != 'U'
            If lcType == 'C'
            	Local lnIndex
            	lnIndex = this.oStack.GetKey(tvData) 
            	If lnIndex > 0
            		this.oStack.Remove(lnIndex)
            	EndIf
            	This.oStack.Add(tvData, tvData) && same key for future search.
            Else
            	This.oStack.Add(tvData, Sys(2015)) && random key (it doesn't matter)
            EndIf
        Endif
    EndFunc

    Function Pop As Variant
        Local lvData As Variant
        
        If this.oStack.Count > 0
	        lvData = This.oStack.Item(this.oStack.Count)
	        this.oStack.Remove(this.oStack.Count)
	    Else
	    	lvData = .null.
	    EndIf
        Return lvData
    EndFunc

    Function Peek As Variant
        Local lvData As Variant
        If this.oStack.Count > 0
	        lvData = This.oStack.Item(this.oStack.Count)
	    Else
	    	lvData = .null.
	    EndIf
        Return lvData
    EndFunc

    Function Empty As Boolean
        Return this.oStack.Count > 0
    EndFunc

    Function Get(tvIndexOrKey) As Object
    	Do case
    	case Type('tvIndexOrKey') == 'N'
	    	If !Between(tvIndexOrKey, 1, this.oStack.Count)
	    		Return .null.
	    	EndIf
	    	Return This.oStack.Item(tvIndexOrKey)
	    Case Type('tvIndexOrKey') == 'C'
	    	tvIndexOrKey = this.oStack.GetKey(tvIndexOrKey)
	    	If tvIndexOrKey > 0
	    		Return this.oStack.Item(tvIndexOrKey)
	    	EndIf
	    EndCase
	    Return .null.
    EndFunc

    Function Size As Integer
        Return this.oStack.Count
    EndFunc
EndDefine
