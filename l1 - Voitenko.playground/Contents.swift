import Cocoa

func quadratic(a: Double, b: Double, c: Double) {
    
    var x1: Double = 0
    var x2: Double = 0
    
    let d: Double = pow(b, 2) - 4 * a * c
    
    if d < 0 {
        print("Дискриминант отрицательный, поэтому корней нет.")
    } else if d > 0 {
        x1 = (-b + sqrt(d))/(2 * a)
        x2 = (-b - sqrt(d))/(2 * a)
        print("Дискриминант положительный.\nУравнение имеет два корня: \(x1) и \(x2).")
    } else if d == 0 {
        x1 = (-b + sqrt(d))/(2 * a)
        print("Дискриминант равен нулю.\nУравнение имеет один корень: \(x1).")
    }
    
}

print("-- ЗАДАНИЕ 1 --")
quadratic(a: 1, b: -2, c: -3)

func triangle(a: Int, b: Int) {
    
    let c = sqrt(Double(a) + Double(b))
    let perimeter = a + b + Int(c)
    let square = (a * b) / 2
    
    print("Гипотенуза: \(String(format: "%.2f", c))\nПлощадь: \(square)\nПериметр: \(perimeter)")
}

print("\n-- ЗАДАНИЕ 2 --")
triangle(a: 4, b: 6)

func bank(sum: Int, percent: Int) {
    
    var sum = sum
    
    for i in 1...5 {
        sum = sum + ((sum * percent) / 100)
        print("Сумма вашего вклада на \(i) год: \(sum) рублей.")
    }
}

print("\n-- ЗАДАНИЕ 3 --")
bank(sum: 100, percent: 5)
