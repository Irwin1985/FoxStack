&& ======================================================================== &&
&& Class FoxStack
&& ======================================================================== &&
Define Class FoxStack As Custom
    Hidden Stack(1)
    Hidden StackCounter
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init
        This.StackCounter = 0
    EndFunc
&& ======================================================================== &&
&& Function Push
&& ======================================================================== &&
    Function Push
        lParameters tvData As Variant
        If Type("tvData") != "U"
            This.IncreaseStack()
            This.Stack[This.StackCounter] = tvData
        Endif
    EndFunc
&& ======================================================================== &&
&& Function Pop
&& ======================================================================== &&
    Function Pop As Variant
        Local lvData As Variant
        lvData = This.GetStackValue()
        If Not IsNull(lvData)
            This.DecreaseStack()
        Endif
        Return lvData
    EndFunc
&& ======================================================================== &&
&& Function Peek
&& ======================================================================== &&
    Function Peek As Variant
        Local lvData As Variant
        lvData = This.GetStackValue()
        Return lvData
    EndFunc
&& ======================================================================== &&
&& Function Empty
&& ======================================================================== &&
    Function Empty As Boolean
        Return (This.StackCounter = 0)
    EndFunc
&& ======================================================================== &&
&& Function Search
&& ======================================================================== &&
    Function Search As Variant
        lParameters tvData As Variant
        Local lvItem As Variant, lbFound As Boolean, nIndex As Integer, lcSupportedTypes As String
        lvItem  = .Null.
        lbFound = .F.
        nIndex  = 0
        lcSupportedTypes = "CINYDTL"
        If Not This.Empty()
            For nIndex = 1 To Alen(This.Stack, 1) Step 1
                lvItem = This.Stack[nIndex]
                lcItemType = Type("lvItem")
                If lcItemType != "U"
                    Do Case
                    Case lcItemType == "O" And Type("tvData") == "O"
                        If Type("lvItem.Name") == "C" And Type("tvData.Name") == "C"
                            lbFound = (tvData.Name == lvItem.Name)
                        Endif
                    Case lcItemType $ lcSupportedTypes And Type("tvData") $ lcSupportedTypes
                        lbFound = (tvData == lvItem)
                    OtherWise
                    EndCase
                Endif
                If lbFound
                    Exit
                Endif
            EndFor
        Else
        Endif
        Return Iif(nIndex > 0, nIndex, -1)
    EndFunc
&& ======================================================================== &&
&& Hidden Function IncreaseStack
&& ======================================================================== &&
    Hidden Function IncreaseStack As Void
        This.StackCounter = This.StackCounter + 1
        Dimension This.Stack(This.StackCounter)
    EndFunc
&& ======================================================================== &&
&& Hidden Function DecreaseStack
&& ======================================================================== &&
    Hidden Function DecreaseStack As Void
        If Not This.Empty()
            This.StackCounter = This.StackCounter - 1
            If This.StackCounter > 0
                Dimension This.Stack(This.StackCounter)
            Endif
        Else
            This.Stack[This.StackCounter] = .Null.
        Endif
    EndFunc
&& ======================================================================== &&
&& Hidden Function GetStackValue
&& ======================================================================== &&
    Hidden Function GetStackValue As Variant
        Local lvData As Variant
        lvData = .Null.
        If Not This.Empty()
            lvData = This.Stack[This.StackCounter]
        Endif
        Return lvData
    EndFunc
EndDefine