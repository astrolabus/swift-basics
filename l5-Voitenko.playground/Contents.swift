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

protocol Car {
    
    var eugineState: EugineState { get set }
    var windowsState: WindowsState { get set }
    var tyreType: TyreType { get set }
    
    func addValue(_ n: Int) -> Void
    
}

extension Car {  //eugine
    mutating func changeEugineState(state: EugineState) {
        eugineState = state
        print(state.rawValue + "\n")
    }
}

extension Car { //windows
    mutating func changeWIndowsState(state: WindowsState) {
        windowsState = state
        print(state.rawValue + "\n")
    }
}

extension Car { //tyre
    mutating func changeTyreType(tyre: TyreType) {
        tyreType = tyre
        print("Установлена \(tyre.rawValue).\n")
    }
}

class TrunckCar: Car {
    
    var eugineState: EugineState
    var windowsState: WindowsState
    var tyreType: TyreType
    
    var maxCargoSpace: Int
    var cargoVolume: Int
    
    init(eugineState: EugineState, windowsState: WindowsState, tyreType: TyreType, maxCargoSpace: Int, cargoVolume: Int) {
        self.eugineState = eugineState
        self.windowsState = windowsState
        self.tyreType = tyreType
        self.maxCargoSpace = maxCargoSpace
        self.cargoVolume = cargoVolume
    }
    
    
    func addValue(_ cargo: Int) -> Void {
        cargoVolume = cargoVolume + cargo
        if cargoVolume > maxCargoSpace {
            print("Такое количество груза не поместится. Вместительность данного грузовика: \(maxCargoSpace)\n")
        } else {
            print("Загруженность грузовика на данный момент: \(cargoVolume)\n")
        }
    }
    
}

extension TrunckCar: CustomStringConvertible {
    
    var description: String {
        return "Состояние двигателя: \(eugineState.rawValue)\nОкна: \(windowsState.rawValue)\nТип резины: \(tyreType.rawValue)\nМаксимальная вместительность кузова: \(maxCargoSpace)\nТекущее количество груза: \(cargoVolume)\n"
    }
    
}

class SportCar: Car {
    
    var eugineState: EugineState
    var windowsState: WindowsState
    var tyreType: TyreType
    
    var brand: String
    var eugineType: String
    
    init(eugineState: EugineState, windowsState: WindowsState, tyreType: TyreType, brand: String, eugineType: String) {
        self.eugineState = eugineState
        self.windowsState = windowsState
        self.tyreType = tyreType
        self.brand = brand
        self.eugineType = eugineType
    }
    
    func addValue(_ speed: Int) -> Void {
        if eugineState == .start {
            print("Текущая скорость: \(speed)\n")
        } else {
            print("Автомобиль выключен. Пожалуйста, заведите его.\n")
        }
    }
    
    
}

extension SportCar: CustomStringConvertible {
    
    var description: String {
        return "Состояние двигателя: \(eugineState.rawValue)\nОкна: \(windowsState.rawValue)\nТип резины: \(tyreType.rawValue)\nМарка: \(brand)\nТип двигателя: \(eugineType)\n"
    }
    
}

print("-- CARGO CAR One --")
var cargoCarOne = TrunckCar(eugineState: .start, windowsState: .open, tyreType: .summer, maxCargoSpace: 300, cargoVolume: 200)
print(cargoCarOne)
cargoCarOne.addValue(300)
cargoCarOne.changeEugineState(state: .stop)

print("-- CARGO CAR Two --")
var cargoCarTwo = TrunckCar(eugineState: .stop, windowsState: .close, tyreType: .winter, maxCargoSpace: 600, cargoVolume: 0)
print(cargoCarTwo)
cargoCarTwo.addValue(500)
cargoCarTwo.changeTyreType(tyre: .summer)

print("-- SPORT CAR One --")
var sportCarOne = SportCar(eugineState: .start, windowsState: .open, tyreType: .winter, brand: "BMV", eugineType: "V10")
print(sportCarOne)
sportCarOne.addValue(200)
sportCarOne.changeWIndowsState(state: .close)

print("-- SPORT CAR Two --")
var sportCarTwo = SportCar(eugineState: .stop, windowsState: .close, tyreType: .winter, brand: "Porsche", eugineType: "V8")
print(sportCarTwo)
sportCarTwo.addValue(100)
sportCarTwo.changeEugineState(state: .start)
