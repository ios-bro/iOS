import Foundation

/*1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
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

struct Bmw {
  var model: String
  var year: Int
  var capacityBoot: Double
  var motorState: OperationWithMotor {
    didSet {
      if motorState == .run {
        print("Motor's state of BMW \(model) is run")
      } else {
        print("Motor's state of BMW \(model) is kill")
      }
    }
  }
  var windowState: OperationWithWindows {
    didSet {
      if windowState == .open {
        print("Window's state of BMW \(model) is open")
      } else {
        print("Window's state of BMW \(model) is close")
      }
    }
  }
  var filledBoot: OperationWithBoot {
    didSet {
      if filledBoot == .load {
        print("Boot's state of BMW \(model) is load")
      } else {
        print("Boot's state of BMW \(model) is unload")
      }
    }
  }
  init() {
    model = "x3"
    year = 2015
    capacityBoot = 4.5
    motorState = .kill
    windowState = .close
    filledBoot = .unload
  }
  init(model: String, year: Int, capacityBoot: Double, motorState: OperationWithMotor, windowState: OperationWithWindows, filledBoot: OperationWithBoot) {
    self.model = model
    self.year = year
    self.capacityBoot = capacityBoot
    self.motorState = motorState
    self.windowState = windowState
    self.filledBoot = filledBoot
  }
  mutating func motor(operation: OperationWithMotor) {
    if operation == .run {
      self.motorState = .run
    } else {
      self.motorState = .kill
    }
  }
  mutating func windows(operation: OperationWithWindows) {
    if operation == .open {
      self.windowState = .open
    } else {
      self.windowState = .close
    }
  }
  mutating func boot(operation: OperationWithBoot) {
    if operation == .load {
      self.filledBoot = .load
    } else {
      self.filledBoot = .unload
    }
  }
  func printProperties() {
    print("Properties of BMW:\n model: \(self.model)\n year: \(self.year)\n capacityBoot: \(self.capacityBoot)\n motorState: \(self.motorState)\n windowState: \(self.windowState)\n filledBoot: \(self.filledBoot)\n")
  }
}

var car1 = Bmw(model: "x6", year: 2017, capacityBoot: 5, motorState: .kill, windowState: .close, filledBoot: OperationWithBoot.unload)
car1.motor(operation: .run)
car1.year = 2018
car1.windows(operation: .open)
car1.printProperties()

var car2 = Bmw()
car2.capacityBoot = 3.5
car2.boot(operation: .load)
car2.printProperties()

var car3 = Bmw.init()
car3.printProperties()

var car4 = Bmw.init(model: "x5", year: 2016, capacityBoot: 3, motorState: .kill, windowState: .close, filledBoot: .unload)
car4.printProperties()
