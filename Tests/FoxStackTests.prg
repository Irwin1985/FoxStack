Define Class FoxStackTests As FxuTestCase Of FxuTestCase.prg
	#If .F.
		Local This As FoxStackTests Of FoxStackTests.prg
	#Endif
	icTestPrefix = "Test"
	oStack   = .Null.
	cProcAct = ""
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		This.cProcAct = Set("Procedure")
		Set Path To "Src" Additive
		Set Procedure To "FoxStack.prg" Additive
		This.oStack = Createobject("FoxStack")
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		Local lcProcAct As String
		lcProcAct = This.cProcAct
		This.oStack = .Null.
		Clear Class FoxStack
		Release Procedure FoxStack
		If Not Empty(lcProcAct)
			Set Procedure To (lcProcAct)
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(This.oStack, "Test Failed")
			This.MessageOut("Object created Ok")
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestPushMethod
&& ======================================================================== &&
	Function TestPushMethod
		This.PushStuffs(10)
	Endfunc
&& ======================================================================== &&
&& Function TestPopMethod
&& ======================================================================== &&
	Function TestPopMethod
		This.MessageOut("================Push List================")
		This.PushStuffs(20)
		This.MessageOut("================Pop List================")
		For nIndex = 1 to 10
			This.MessageOut("Popping : " + Transform(This.oStack.Pop()))
		EndFor
	EndFunc
&& ======================================================================== &&
&& Function TestPopEmptyStack
&& ======================================================================== &&
	Function TestPopEmptyStack
		This.MessageOut("Popping is : " + Transform(This.oStack.Pop()))
	EndFunc
&& ======================================================================== &&
&& Function TestPeek
&& ======================================================================== &&
	Function TestPeek
		This.MessageOut("================Push List================")
		This.PushStuffs(20)
		This.MessageOut("================Pop List================")
		For nIndex = 1 to 10
			This.MessageOut("Popping : " + Transform(This.oStack.Pop()))
		EndFor
		This.MessageOut("================Peek================")
		This.MessageOut("Peek : " + Transform(This.oStack.Peek()))
	EndFunc
&& ======================================================================== &&
&& Function TestPeekEmptyStack
&& ======================================================================== &&
	Function TestPeekEmptyStack
		This.MessageOut("Peek is : " + Transform(This.oStack.Pop()))
	EndFunc
&& ======================================================================== &&
&& Function TestEmptyStack
&& ======================================================================== &&
	Function TestEmptyStack
		This.MessageOut("Empty is : " + Transform(This.oStack.Empty()))
	EndFunc
&& ======================================================================== &&
&& Function TestNotEmptyStack
&& ======================================================================== &&
	Function TestNotEmptyStack
		This.oStack.Push(1985)
		This.MessageOut("Empty is : " + Transform(This.oStack.Empty()))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchInteger
&& ======================================================================== &&
	Function TestSearchInteger
		This.MessageOut("================Push List================")
		This.PushStuffs(20)
		This.MessageOut("================Search================")
		This.MessageOut("Search 10 index : " + Transform(This.oStack.Search(10)))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchString
&& ======================================================================== &&
	Function TestSearchString
		This.MessageOut("================Push List================")
		This.oStack.Push("Hello")
		This.MessageOut(This.oStack.Peek())
		This.oStack.Push("World")
		This.MessageOut(This.oStack.Peek())
		This.oStack.Push("From")
		This.MessageOut(This.oStack.Peek())
		This.oStack.Push("Stack")
		This.MessageOut(This.oStack.Peek())
		This.MessageOut("================Search================")
		This.MessageOut("Search 'From' index : " + Transform(This.oStack.Search("From")))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchDate
&& ======================================================================== &&
	Function TestSearchDate
		This.MessageOut("================Push List================")
		ldDate = Date()
		This.oStack.Push(Date() + 1)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(Date() + 2)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(ldDate)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(Date() + 3)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.MessageOut("================Search================")
		This.MessageOut("Search '" + Transform(ldDate) + "' index : " + Transform(This.oStack.Search(ldDate)))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchDateTime
&& ======================================================================== &&
	Function TestSearchDateTime
		This.MessageOut("================Push List================")
		ldDate = Datetime()
		This.oStack.Push(Datetime() + 1)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(Datetime() + 2)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(Datetime() + 3)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(ldDate)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.MessageOut("================Search================")
		This.MessageOut("Search '" + Transform(ldDate) + "' index : " + Transform(This.oStack.Search(ldDate)))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchObject
&& ======================================================================== &&
	Function TestSearchObject
		This.MessageOut("================Push List================")
		loObj = CreateObject("objHelper")
		This.oStack.Push(10)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push("String sample")
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(.T.)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push(loObj)
		This.MessageOut(Transform(This.oStack.Peek()))
		This.oStack.Push("another string")
		This.MessageOut(Transform(This.oStack.Peek()))
		This.MessageOut("================Search================")
		This.MessageOut("Search '" + Transform(loObj.Name) + "' index : " + Transform(This.oStack.Search(loObj)))
	EndFunc
&& ======================================================================== &&
&& Function TestSearchNotFound
&& ======================================================================== &&
	Function TestSearchNotFound
		This.MessageOut("Search NonExisting index : " + Transform(This.oStack.Search("Nothing")))
	EndFunc
&& ======================================================================== &&
&& Function PushStuffs
&& ======================================================================== &&
	Function PushStuffs(tnTimes As Integer)
		For nIndex = 1 to tnTimes
			This.oStack.Push(nIndex * 2)
			This.MessageOut("Pushing : " + Transform(This.oStack.Peek()))
		EndFor	
	EndFunc
EndDefine

Define Class objHelper as Custom
	test = "test"
EndDefine