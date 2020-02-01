import Foundation


enum EugineState: String {
    case start = "Автомобиль заведен"
    case stop = "Автомобиль выключен"
}

enum WindowsState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum TyreType: String {
    case winter = "зимняя резина"
    case summer = "летняя резина"
}

class Car {
    
    var eugineState: EugineState
    var windowsState: WindowsState
    var tyreType: TyreType
    
    init(eugineState: EugineState, windowsState: WindowsState, tyreType: TyreType) {
        self.eugineState = eugineState
        self.windowsState = windowsState
        self.tyreType = tyreType
    }
    
    func addValue(_ n: Int) {
        //пустой метод
    }
    
    //дополнительные функции
    
    func changeTyre(tyre: TyreType) {
        tyreType = tyre
        print("Установлена \(tyre.rawValue).\n")
    }
    
    func changeWindowsState(state: WindowsState) {
        windowsState = state
        print(state.rawValue + "\n")
    }
    
    func changeEugineState(state: EugineState) {
        eugineState = state
        print(state.rawValue + "\n")
    }
    
    //вывод информации о машине
    func printCarInfo() {
        print("Состояние двигателя: \(eugineState.rawValue)\nОкна: \(windowsState.rawValue)\nТип резины: \(tyreType.rawValue)\n")
    }
    
}

class TrunckCar: Car {
    
    enum CargoType: String {
        case food = "Еда"
        case constractionMaterials = "Строительные материалы"
        case fragile = "Хрупкий груз"
    }
    
    var wheels: Int
    var maxCargoSpace: Int
    var cargoVolume: Int
    var cargoType: CargoType
    
    init(eugineState: EugineState, windowsState: WindowsState, tyreType: TyreType, wheels: Int, maxCargoSpace: Int, cargoVolume: Int, cargoType: CargoType) {
        self.wheels = wheels
        self.maxCargoSpace = maxCargoSpace
        self.cargoVolume = cargoVolume
        self.cargoType = cargoType
        super.init(eugineState: eugineState, windowsState: windowsState, tyreType:  tyreType)
    }
    
    override func addValue(_ cargo: Int) {
        cargoVolume = cargoVolume + cargo
        if cargoVolume > maxCargoSpace {
            print("Такое количество груза не поместится. Вместительность данного грузовика: \(maxCargoSpace)\n")
        } else {
            print("Загруженность грузовика на данный момент: \(cargoVolume)\n")
        }
    }
    
    override func printCarInfo() {
        print("Тип груза: \(cargoType.rawValue)\nМаксимальная вместительность кузова: \(maxCargoSpace)\nТекущее количество груза: \(cargoVolume)\nКоличество колес: \(wheels)\nТип резины: \(tyreType.rawValue)\n")
    }
    
}

class SportCar: Car {
    
    enum EugineType: String {
        case v10 = "V10"
        case v8 = "V8"
    }
    
    enum Brand: String {
        case Audi
        case McLaren
        case Porsche
    }
    
    var eugineType: EugineType
    var doorsCount: Int
    var brand: Brand
    
    init(eugineState: EugineState, windowsState: WindowsState, tyreType: TyreType, eugineType: EugineType, doorsCount: Int, brand: Brand) {
        self.eugineType = eugineType
        self.doorsCount = doorsCount
        self.brand = brand
        super.init(eugineState: eugineState, windowsState: windowsState, tyreType: tyreType)
    }
    
    override func addValue(_ speed: Int) {
        if eugineState == .start {
            print("Текущая скорость: \(speed)\n")
        } else {
            print("Автомобиль выключен. Пожалуйста, заведите его.\n")
        }
    }
    
    override func printCarInfo() {
        print("Марка: \(brand)\nТип двигателя: \(eugineType.rawValue)\nКоличество дверей: \(doorsCount)\nТип резины: \(tyreType.rawValue)\n")
    }
    
}

print("-- CAR One --")
var carOne = Car(eugineState: .stop, windowsState: .close, tyreType: .winter)
carOne.printCarInfo()
carOne.changeEugineState(state: .start)

print("-- CAR Two --")
var carTwo = Car(eugineState: .start, windowsState: .open, tyreType: .summer)
carTwo.printCarInfo()
carTwo.changeWindowsState(state: .close)

print("-- CARGO CAR One --")
var cargoCarOne = TrunckCar(eugineState: .stop, windowsState: .close, tyreType: .winter, wheels: 6, maxCargoSpace: 600, cargoVolume: 200, cargoType: .constractionMaterials)
cargoCarOne.printCarInfo()
cargoCarOne.changeTyre(tyre: .summer)
cargoCarOne.addValue(300)

print("-- CARGO CAR Two --")
var cargoCarTwo = TrunckCar(eugineState: .start, windowsState: .open, tyreType: .summer, wheels: 4, maxCargoSpace: 200, cargoVolume: 88, cargoType: .fragile)
cargoCarTwo.printCarInfo()
cargoCarTwo.addValue(125)

print("-- SPORT CAR Two --")
var sportCarOne = SportCar(eugineState: .stop, windowsState: .close, tyreType: .winter, eugineType: .v10, doorsCount: 2, brand: .Porsche)
sportCarOne.printCarInfo()
sportCarOne.changeWindowsState(state: .open)
sportCarOne.addValue(130)

print("-- SPORT CAR One --")
var sportCarTwo = SportCar(eugineState: .start, windowsState: .open, tyreType: .summer, eugineType: .v8, doorsCount: 4, brand: .Audi)
sportCarTwo.printCarInfo()
sportCarTwo.addValue(200)

