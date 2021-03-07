import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
func isEvenNumber(number: Int) -> Bool{
    number % 2 == 0 ? true : false
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isDevisionBy3(number: Int) -> Bool {
    number % 3 == 0 ? true : false
}

//3. Создать возрастающий массив из 100 чисел.
    //Первый вариант создание массива через цикл for.
var growUpArray = [Int]()
for x in 1...100 {
growUpArray.append(x)
}
    //Второй вариант создание массива.
var growUpArray2 = Array(1...100)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for x in growUpArray {
    //Здесь я использовал принудительную распаковку опционала, т.к. цикл ограничен элементами массива.
    if isEvenNumber(number: x) { growUpArray.remove(at: (growUpArray.firstIndex(of: x))!) }
}

for x in growUpArray {
    //Здесь я использовал принудительную распаковку опционала, т.к. цикл ограничен элементами массива.
    if !isDevisionBy3(number: x) { growUpArray.remove(at: (growUpArray.firstIndex(of: x))!) }
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//     Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func addFibonachiArray(array: [Int], time: Int) -> [Int] {
    var arrayFibonachi = [0, 1]
    for _ in 1...time {
        let f1 = arrayFibonachi[arrayFibonachi.count-2]
        let f2 = arrayFibonachi[arrayFibonachi.count-1]
        arrayFibonachi.append(f1 + f2)
    }
return array + arrayFibonachi
}

var newArray = addFibonachiArray(array: growUpArray, time: 50)//для функции указываем к какой коллекции надо прибавить число фибоначи и количество этих чисел.

/*6. * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:*/
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
var arrayInteger = Array(2...100)

//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.

var p = arrayInteger[0]

while p < arrayInteger[arrayInteger.count - 1] {
    var p1 = p
    for i in arrayInteger {
        if 2 + p1 == i {
            arrayInteger.remove(at: (arrayInteger.firstIndex(of: i))!); p1 += 2;
        }
     }

    for i in arrayInteger {
        if i > p { p = i; break }
    }
}


