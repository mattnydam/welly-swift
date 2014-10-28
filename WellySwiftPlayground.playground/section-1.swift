// Playground - noun: a place where people can play

import UIKit


// MARK: Comments

// This is a single line comment

/*
    This is 
    multi line
    comment
*/

// MARK: Variables

// This is a variable!
var hello = "Hello, playground"
var number = 100

// Changing a variable is easy!
hello = "Hello, steven"

// This is a variable we cannot change. They are defined with 'let' instead of 'var'
let unchangableName = "Joyce"


// If we uncomment this, it will produce an error
//unchangableName = "Jimbo"


// MARK: Array

// This is an array containing two objects
var wordArray = ["hi", "steven"]

// We are now getting the first object from wordArray
var firstObject = wordArray[0]

//And the second
var secondObject = wordArray[1]


// MARK: - Conditional (If-Else)

var conditionalNumber = 10
if (conditionalNumber == 1) {
    print("Yes")
} else if(conditionalNumber == 3) {
    print("Yes")
} else {
    print("No")
}


// MARK: Loops

var sum = 0

// This is a for-loop. The statement "sum += index" will be run 9 times and add 1 through 9 to the sum variable.
for index in 1...9 {
    sum += index // This is adding the value of index, to our sum variable
}
println(sum)

// MARK: Functions

// This is a function definition
func createFullName() -> String {
    var firstName = "Nicky"
    var lastName = "Hagar"
    
    return firstName + " " + lastName
}

// Here, we have defined the result (Nicky Hagar) of the above function to the variable named fullName
var fullName = createFullName()

