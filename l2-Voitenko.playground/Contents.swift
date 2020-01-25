import Foundation


// --ЗАДАНИЕ 1--
func evenOrOdd(number: Int) -> Bool{
    return number % 2 == 0 ? true : false
}

evenOrOdd(number: 5)
evenOrOdd(number: 6)


//--ЗАДАНИЕ 2--
func devidedByThree(number: Int) -> Bool{
    return number % 3 == 0 ? true : false
}

devidedByThree(number: 6)
devidedByThree(number: 10)


//--ЗАДАНИЕ 3--
var array: [Int] = []

for var i in 0..<100 {
    i += 1
    array.append(i)
}

//--ЗАДАНИЕ 4--
func changeArr(arr: [Int]) -> [Int]{
    return arr.filter{!evenOrOdd(number: $0) && devidedByThree(number: $0)}
}

changeArr(arr: array)

//--ЗАДАНИЕ 5--

func fibonacci(n: Int) -> Void {
    var arr: [Float80] = []
    
    var fib1: Float80 = 0
    var fib2: Float80 = 1
    var temp: Float80 = 0
    
    for _ in 0..<n {
        temp = fib2
        fib2 = fib1 + fib2
        fib1 = temp
        arr.append(fib1)
    }
    
    print(arr)
}

fibonacci(n: 100)

