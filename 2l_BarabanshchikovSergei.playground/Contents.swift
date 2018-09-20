import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
print("Задача №1: ")

var number: Int

func even(number: Int) {
  if number % 2 == 0 {
    print("Число \(number) четное \n")
  } else {
    print("Число \(number) нечетное \n")
  }
}
number = 23
even(number: number)


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
print("Задача №2: ")

var inputNumber: Int

func division(inputNumber: Int) -> String {
  var result: String
  if inputNumber % 3 == 0 {
    result = "Число \(inputNumber) делится на 3 без остатка"
  } else {
    result = "Число \(inputNumber) не делится на 3 без остатка"
  }
  return result
}
inputNumber = 32
print(division(inputNumber: inputNumber) + "\n")


//3. Создать возрастающий массив из 100 чисел.
print("Задача №3: ")

var incArray: [Int] = Array(0...99)
for index in incArray {
  incArray[index] = index + 1
}
print ("\(incArray)\n")


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("Задача №4: ")

for (_, value) in incArray.enumerated() {
  if((value % 2 == 0) || (value % 3 != 0)) {
    incArray.remove(at: incArray.index(of: value)!)
  }
}
print ("\(incArray)\n")


//5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
print("Задача №5: ")

var array: [Decimal] = []

func addFbNumber(_ array: inout [Decimal], _ indexFb: Int) -> [Decimal] {
  var fbArray: [Decimal] = Array(repeating: 0, count: indexFb)
  for (i, _) in fbArray.enumerated() {
    if i == 0 {
      fbArray[i] = 0
    } else if i == 1 {
      fbArray[i] = 1
    } else {
      fbArray[i] = fbArray[i - 1] + fbArray[i - 2]
    }
  }
  array += [fbArray[fbArray.count-1]]
  return array
}
for i in 1...100 {
  addFbNumber(&array, i)
}
print("\(array)\n")


//6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
print("Задача №6: ")

var arrayPrimeNumbers: [Int] = []
for i in 2...545 {
  arrayPrimeNumbers.append(i)
}
var p = 2
while p >= 2 && p < arrayPrimeNumbers.count {
  for (_, value) in arrayPrimeNumbers.enumerated() where value > p && value % p == 0 {
    arrayPrimeNumbers.remove(at: arrayPrimeNumbers.index(of: value)!)
  }
  p = arrayPrimeNumbers[arrayPrimeNumbers.index(of: p)!+1]
}
print(arrayPrimeNumbers)
