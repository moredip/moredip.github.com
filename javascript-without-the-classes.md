# Intro
It seems that every javascript framework of a certain size is required to implement some kind of pseudo-classical type system. I am now fairly convinced that there is no good reason for doing so. I'd like to describe an alternative approach to dealing with types in javascript. This approach comes from a recent project where my team were building a pure-javascript single-page web application. This wasn't a huge codebase, but it was certainly big enough that some sort of structure was needed. The patterns we evolved gave us just enough structure while still allowing us to take advantage of the highly flexible and dynamic nature of javascript.

# A quick tour of Javascript
## Prototypical, not Classical
Javascript is not a classic Object-Oriented language. Over the years many have tried to force it into that mold, but it just won't fit. Typing is achieved through the use of prototypes, not classes. In languages like Ruby or Java you have Clasess and Objects. An Object is always the instance of a specific Class. You generally almost always define an object's behavior by specifying that behavior in the object's class [Footnote about ruby allowing wacky stuff with eigenclass]. In Javascript objects are not based off of a class, but are instead based off of a Prototype. A prototype can be any object, and has no special type.

In a classical OO language an object inherits behavior from its class and also superclasses of its class. In javascript, an object inherits behavior from it's prototype and also from its prototype's prototype, and so on.

## Objects are just a bag of key-value pairs
Javascript objects are essentially just a dictionary of key-value pairs. Public object state is generally added directly to the object as a key-value pair, and 'methods' are simply a instance of a function which has been added directly to the object as a key-value pair.

## Closures can store instance state
All state stored in an object directly is publically accessible, similar to a public instance variable in an OO language. One common trick to control access to state is to store that state outside of the object itself, but closed over by the function which created that object.

<script src="https://gist.github.com/1580895.js?file=closure-encapsulates-object-state.js"></script>

Note that the duck instance we create is *not* storing its name anywhere inside the object. Instead the name argument passed to the createDuck function has been *closed over*, and is accessible to that duck instance. Also note that the value of name is private in a very strong sense. It is *impossible* for any client of the duck instance to see or modify the value of name.

# Our approach
## constructor functions, not types
In a typical OO system you would have classes such as Duck, Pond, Food, etc. to represent the types in the system. In our system we had no classes, just constructor functions. Each type in the system has one or more constructor functions which create instance of that type. So we would have createDuck(...), createPond(...), createFood(...). 

## state in closures
Storing state directly on an object is analogous to having public instance variables in a classic OO language. Public instance variables are almost always a bad idea, and we found the same to be true with storing state directly on an object. Instead we stored state by closing over local variables in the object's constructor functions.

## Mixins for shared public behavior
Public 'methods' are just functions added to an object. You can mix in new public behaviour by just merging the contents of the a mixin object with the instance itself. For example:

<script src="https://gist.github.com/1580895.js?file=extending-with-mixins.js"></script>

Here we have a shouter mixin and a constructor function which uses that mixin to construct a new type of duck which can shout. We often used this pattern as an alternative to implementation inheritance. Instead of a base class which provided standard behavior and subclasses which layered on additional behavior we would have a base mixin which provided standard behavior and constructor functions which provided specific additional behavior and mixed in the standard behavior from the base mixin.

## Composition over Inheritance
A slightly unfortunately side-effect of storing our instance state in closures was that it is hard to expose that state to mixins and sub-classes. [Example here would be good]. This led to us strongly favoring composition over inheritance/mixin. So instead of mixing in behavior that requires access to private state, we would wrap that behavior in an object and call functions on that object, passing in the private state as needed.

## No prototypes, no new.
By following this approach, we've discovered we have no need for prototypical typing, and thus no need for the `new` operator.

## Namespacing
We followed the standard practice in large Javascript codebases of namespacing using the module pattern. Coupled with our other practices, this meant that we generally just exposed constructor functions to other parts of the system. 

## Dependencies
Dependencies are wired together in an initial boot function, often by providing constructor functions as parameters to other constructor functions. It's quite common that [partially-specified functions](http://ejohn.org/blog/partial-functions-in-javascript/) are used to encapsulate lower-level or cross-functional dependencies. Here's another contrived example:

<script src="https://gist.github.com/1580895.js?file=currying-and-constructor-functions.js"></script>

This example shows two distinct applications of currying. First, we have exposed a curried createDuck function to the outside world, with the logger dependency hidden. We also used a curried createLogger function called duckLogger to pass to the createDuck function. Again this was to remove implementation details that the createDuck implementation should not be aware of or care about.

There is a strong similarity between our use of partially applied functions and the parameterized Factory classes you see quite often in statically type OO code (particularly Java). 
