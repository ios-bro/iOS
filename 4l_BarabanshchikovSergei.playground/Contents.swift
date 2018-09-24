import Foundation

/*1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.*/


enum OperationWithMotor {
  case run, kill
}
enum OperationWithWindows {
  case open, close
}
enum OperationWithBoot {
  case load, unload
}
enum PriceCar {
  case high, low
}
enum SpeedCar {
  case high, low
}

class Car {
  let model: String
  let year: Int
  var capacityBoot: Double
  var motorState: OperationWithMotor {
    didSet {
      if motorState == .run {
        print("Motor's state of \(model) is run")
      } else {
        print("Motor's state of \(model) is kill")
      }
    }
  }
  var windowState: OperationWithWindows {
    didSet {
      if windowState == .open {
        print("Window's state of \(model) is open")
      } else {
        print("Window's state of \(model) is close")
      }
    }
  }
  var filledBoot: OperationWithBoot {
    didSet {
      if filledBoot == .load {
        print("Boot's state of \(model) is load")
      } else {
        print("Boot's state of \(model) is unload")
      }
    }
  }
  init(model: String, year: Int, capacityBoot: Double, motorState: OperationWithMotor, windowState: OperationWithWindows, filledBoot: OperationWithBoot) {
    self.model = model
    self.year = year
    self.capacityBoot = capacityBoot
    self.motorState = motorState
    self.windowState = windowState
    self.filledBoot = filledBoot
  }
  func motor(operation: OperationWithMotor) {
    if operation == .run {
      self.motorState = .run
    } else {
      self.motorState = .kill
    }
  }
  func windows(operation: OperationWithWindows) {
    if operation == .open {
      self.windowState = .open
    } else {
      self.windowState = .close
    }
  }
  func boot(operation: OperationWithBoot) {
    if operation == .load {
      self.filledBoot = .load
    } else {
      self.filledBoot = .unload
    }
  }
  func descriptionCar() {
    print("Описание машины: ")
  }
  func printProperties() {
    print("Properties of car:\n model: \(self.model)\n year: \(self.year)\n capacityBoot: \(self.capacityBoot)\n motorState: \(self.motorState)\n windowState: \(self.windowState)\n filledBoot: \(self.filledBoot)\n")
  }
}
class SportCar: Car {
  var highPrice: PriceCar
  var highSpeed: SpeedCar
  init(model: String, year: Int, capacityBoot: Double, motorState: OperationWithMotor, windowState: OperationWithWindows, filledBoot: OperationWithBoot, highPrice: PriceCar, highSpeed: SpeedCar) {
    self.highPrice = highPrice
    self.highSpeed = highSpeed
    super.init(model: model, year: year, capacityBoot: capacityBoot, motorState: motorState, windowState: windowState, filledBoot: filledBoot)
  }
  override func descriptionCar() {
    super.descriptionCar()
    print("\(model): Быстро едет, дорого стоит!")
  }
  override func printProperties() {
    print("Properties of car:\n model: \(self.model)\n year: \(self.year)\n capacityBoot: \(self.capacityBoot)\n motorState: \(self.motorState)\n windowState: \(self.windowState)\n filledBoot: \(self.filledBoot)\n highPrice: \(self.highPrice)\n highSpeed: \(self.highSpeed)\n")
  }
}

class TrunkCar: Car {
  var lowPrice: PriceCar
  var lowSpeed: SpeedCar
  init(model: String, year: Int, capacityBoot: Double, motorState: OperationWithMotor, windowState: OperationWithWindows, filledBoot: OperationWithBoot, lowPrice: PriceCar, lowSpeed: SpeedCar) {
    self.lowPrice = lowPrice
    self.lowSpeed = lowSpeed
    super.init(model: model, year: year, capacityBoot: capacityBoot, motorState: motorState, windowState: windowState, filledBoot: filledBoot)
  }
  override func descriptionCar() {
    super.descriptionCar()
    print("\(model): Не гонит, норм стоит!")
  }
  override func printProperties() {
    print("Properties of car:\n model: \(self.model)\n year: \(self.year)\n capacityBoot: \(self.capacityBoot)\n motorState: \(self.motorState)\n windowState: \(self.windowState)\n filledBoot: \(self.filledBoot)\n lowPrice: \(self.lowPrice)\n lowSpeed: \(self.lowSpeed)\n")
  }
}

let car1 = SportCar(model: "Ferrari", year: 2018, capacityBoot: 1, motorState: .run, windowState: .close, filledBoot: .unload, highPrice: .high, highSpeed: .high)
car1.descriptionCar()
car1.motorState = .kill
car1.printProperties()

let car2 = TrunkCar(model: "Kamaz", year: 2017, capacityBoot: 50, motorState: .kill, windowState: .open, filledBoot: .unload, lowPrice: .low, lowSpeed: .low)
let car3 = car2
car2.descriptionCar()
car2.motor(operation: .run)
car2.printProperties()

car3.descriptionCar()
car3.windowState = .close
car3.printProperties()

car2.printProperties()

