import UIKit

var summ: Double = 1000000
let percent: Double = 0.12 //Проценты по вкладу сразу указываем как коэффициент.
let t: Int = 5 //Задаем срок размещение депохита
var result: Double

for year in 1...t {
    result = summ * percent
    print("За \(year)-й год сумма процентов составит \(String(format: "%.2f", result))\nСумма депозита \(String(format: "%.2f", summ))")
    summ += result
}
