import UIKit

let a:Double = 9
let b:Double = -6
let c:Double = 2

var d:Double = sqrt(b*b-4*a*c)

if d.isNaN {
        print("В квадратном уравнении нет корней.")
    } else if (d == 0) {
        var x = (-(b) + d) / 2 * a
        print("В квадратном уровнении один корень.\nОн равен: \(x)")
    } else {
        var x1 = (-(b) + d) / 2 * a
        var x2 = (-(b) - d) / 2 * a
        print("Квадратное уровнение имеет два корня.\nПервый корень равен: \(x1)\nВторой корень равен: \(x2)")
    }
