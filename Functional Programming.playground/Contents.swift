

/*: 
 ## Swift Functional Programming: Basic Concepts
 
 **Immutability**:
    `let foo = 1`
 
 **Value types**:
    `struct CGRect { }`
 
 **Pure functions**
 ```
     func sum(a: Int, _ b: Int) -> Int {
         return a + b
     }
 ```
 
 **First-class functions**: it means that we can assign functions to variables, just like we would with an Int or String.
 ```
     func sayHello() {
         print("Hi!")
     }
     let greeting = sayHello
     greeting() \\ Hi!
 ```
 
 **Higher-order functions**: Use a function as an argument and/or return a function
 


 ```
     func inside() -> Void {
         print("Yo!")
     }
     
     func outside(inner: () -> Void) {
         inner()
     }

     outside(inside) // prints: Yo!
 ```
 ### Advanced Concepts: Chaining, Composition and Currying...
 
 */