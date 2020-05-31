# FoxStack
`FoxStack` provides a Stack class which models and implements Stack data structure. The class is based on the basic principle of <code>LIFO</code>. In addition to the basic `Push()` and `Pop()` methods, the class provides three more functions that follows `Empty()`, `Search()` and `Peek()`.

# Table of Contents

- [Installation](#installation)
- [Simple Test](#simple-test)
- [License](#license)


## Installation

```
Just copy the FoxStack prg anywhere into your project PATH folder.
```

## Simple Test
```xBase
// declare the FoxStack Prg
Set Procedure to "FoxStack" Additive

// Instantiate FoxStack Object
loStack = CreateObject("FoxStack")

// Push any data type at the top of the Stack
loStack.Push("Hello")
loStack.Push("World")
loStack.Push(1985)
loStack.Push(.T.)

// Now Pops something from the top of the Stack.
lvResult = loStack.Pop()
?lvResult && .T. (remember the LIFO principle).
```

## Useful Methods
```xBase
// Push() 
// Pushes an element on the top of the stack.

loStack.Push("Hello World!")

// Pop() 
// Removes and returns the top element of the stack. If you call Pop() when the invoking stack is empty then you got a .Null. as result.

loStack.Push("Hello")
lcResult = loStack.Pop() // returns the top element.
?lcResult // 'Hello'
?loStack.Empty() // .T.

// Peek() 
// Returns the element on the top of the stack, but does not remove it.

loStack.Push("Hello")
lcResult = loStack.Peek()
?lcResult // 'Hello'
?loStack.Empty() // .F.

// Empty() 
// It returns .T. if nothing is on the top of the stack. Else, returns .F.

loStack.Push("Hello")
?loStack.Empty() // .F.
loStack.Pop()
?loStack.Empty() // .T.

// Search() 
// It determines whether an element exists in the stack. If the element is found, it returns the position of the element from the top of the stack. Else, it returns -1.

loStack.Push("Long")
loStack.Push("Live")
loStack.Push("for")
loStack.Push("Visual FoxPro")

?loStack.Search("for") // 2
```
## License

FoxStack is released under the MIT Licence.
