import Foundation

enum TyreType: String {
    case winter = "зимняя резина"
    case summer = "летняя резина"
}

enum EugineState: String {
    case start = "Автомобиль заведен"
    case stop = "Автомобиль выключен"
}

enum WindowsState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

struct Car {
    
    enum bodyType: String {
        case hatchback = "Хэтчбэк"
        case sedan = "Седан"
        case CUV = "CUV"
    }
    
    let model: String
    let year: Int
    let color: String
    let type: bodyType
    let euginePower: Double
    
    var tyreType: TyreType
    var eugineState: EugineState
    var windowsState: WindowsState
    
    //методы
    mutating func changeWindowState(state: WindowsState) {
        windowsState = state
        print(state.rawValue + "\n")
    }
    
    mutating func changeEugineState(state: EugineState) {
        eugineState = state
        print(state.rawValue + "\n")
    }
    
    mutating func changeTyre(tyre: TyreType) {
        tyreType = tyre
        print("Установлена \(tyre.rawValue).\n")
    }
    
    func printCarInfo() {
        print("Марка автомобиля и год: \(model), \(year)\nТип кузова: \(type.rawValue)\nТип резины: \(tyreType.rawValue)\nЦвет: \(color)\nМощность двигателя: \(euginePower)\n")
    }
}

struct Cargo {
    
    enum CargoSpace: Int {
        case lightCargo = 100
        case mediumCargo = 300
        case heavyCargo = 600
    }
    
    let model: String
    let year: Int
    
    var eugineState: EugineState
    var windowsState: WindowsState
    
    var tyreType: TyreType
    let cargoSpace: CargoSpace
    var cargoVolume: Int
    
    //методы
    mutating func changeCargoVolume(n: Int) {
        cargoVolume = cargoVolume + n
        if cargoVolume > cargoSpace.rawValue {
            print("Такое количесво груза не поместиться в грузовик. Его вместительность: \(cargoSpace.rawValue)\n")
        } else {
            print("Загруженность грузовика на данный момент: \(cargoVolume)\n")
        }
    }
    
    mutating func changeTyre(tyre: TyreType) {
        tyreType = tyre
        print("Установлена \(tyre.rawValue).\n")
    }
    
    mutating func changeWindowState(state: WindowsState) {
        windowsState = state
        print(state.rawValue + "\n")
    }
    
    mutating func changeEugineState(state: EugineState) {
        eugineState = state
        print(state.rawValue + "\n")
    }
    
    func printCargoInfo() {
        print("Марка автомобиля и год: \(model), \(year)\nТип резины: \(tyreType.rawValue)\nВместительность кузова: \(cargoSpace.rawValue),\nТекущее количество груза: \(cargoVolume)\n")
    }
}

var cargoCarOne = Cargo(model: "Maz", year: 2000, eugineState: .stop, windowsState: .open, tyreType: .summer, cargoSpace: .lightCargo, cargoVolume: 20)

var carOne = Car(model: "Kia Soul", year: 2011, color: "Черный", type: .hatchback, euginePower: 150, tyreType: .summer, eugineState: .stop, windowsState: .close)

var cargoCarTwo = Cargo(model: "KAMAZ", year: 2012, eugineState: .start, windowsState: .close, tyreType: .summer, cargoSpace: .heavyCargo, cargoVolume: 150)

var carTwo = Car(model: "Volkswagen Beetle", year: 2019, color: "Голубой", type: .sedan, euginePower: 105, tyreType: .winter, eugineState: .start, windowsState: .open)

print("--Первый грузовик--")
cargoCarOne.printCargoInfo()
cargoCarOne.changeCargoVolume(n: 400)
cargoCarOne.changeEugineState(state: .start)

print("--Второй грузовик--")
cargoCarTwo.printCargoInfo()
cargoCarTwo.changeCargoVolume(n: 347)
cargoCarTwo.changeWindowState(state: .open)

print("--Первый автомобиль--")
carOne.printCarInfo()
carOne.changeWindowState(state: .open)
carOne.changeTyre(tyre: .winter)

print("--Второй автомобиль--")
carTwo.printCarInfo()
carTwo.changeEugineState(state: .stop)
carTwo.changeTyre(tyre: .summer)





