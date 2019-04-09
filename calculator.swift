/*********************************************************************
 Simple calculator program in swift. Supports addition, subtraction
 multiplication, division, and exponentiation.

 @author Josh Weinmann
 @version 4.8.2019
 ********************************************************************/

import Foundation

/** value for running total */
var total: Double = 0

/*********************************************************************
 Performs correct operation based on operation
 @param a first number in calculation
 @param op operator character
 @param b second number in calculation
 ********************************************************************/
func doCalculation(a: Double, op: Character, b: Double) {

    // addition
    if op == "+" {
        total = a + b
        print("= ", terminator: "")
        print(total)
    }

    // subtraction
    else if op == "-" {
        total = a - b
        print("= ", terminator: "")
        print(total)
    }

    // multiplication
    else if op == "*" {
        total = a * b
        print("= ", terminator: "")
        print(total)
    }

    // division (catch divide by zero error)
    else if op == "/" {
        if b == 0 {
            print("No calculation. Divide by zero error")
        }
        total = a / b
        print("= ", terminator: "")
        print(total)
    }

    // exponentiation
    else if op == "^" {
        var result: Double = 1
        var i: Int = 0
        while i < Int(b) {
            result *= a
            i += 1
        }
        total = result
        print("= ", terminator: "")
        print(total)
    }

    // didn't enter a valid operation
    else {
        print("Not a valid operation")
        print("Quitting...")
        exit(EXIT_FAILURE)
    }
}

/*********************************************************************
 Exit program if user input 'q' to quit
 @param c operator character
 ********************************************************************/
func checkQuit(c: Character) {
    if c == "q" {
        print("Quitting...")
        exit(EXIT_FAILURE)
    }
}

/*********************************************************************
 Take in user input and perform calculations until they ask to quit
 ********************************************************************/
func main() {

    // welcome messages
    print("Valid operations include +, -, *, /, and ^.");
    print("Enter 'q' as operation to quit")

    // ask for first number
    print("Enter a number: ", terminator: "")
    let first = Double(readLine()!)

    // ask for operation
    print("Enter operation: ", terminator: "")
    let op = readLine()
    checkQuit(c: Character(op!))

    // ask for next number
    print("Enter a number: ", terminator: "")
    let num = Double(readLine()!)

    // perform correct operation
    doCalculation(a: Double(first!), op: Character(op!), b: Double(num!))

    // loop to continue input until 'q' in entered
    repeat {
        // ask for operation
        print("Enter operation: ", terminator: "")
        let op = readLine()
        checkQuit(c: Character(op!))

        // ask for next number
        print("Enter a number: ", terminator: "")
        let num = Double(readLine()!)

        // perform correct operation
        doCalculation(a: Double(total), op: Character(op!), b: Double(num!))
    } while op != "q"
}

// run function to start program
main()
