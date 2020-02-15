import Foundation

struct Shipment {
    var type: Cargo
    var weight: Double
    let destination: Destination
}

struct Cargo {
    let name: String
}

enum Destination: String {
    case RU = "Russian Federation"
    case NZ = "New Zeland"
    case JP = "Japan"
}

class Storage {
    
    enum CargoDeliveryError: Error {
        case notInStorage         //нет на складе
        case noAvailableCourier   //нет доступных курьеров
        
        var localizedDescription: String {
            switch self {
            case .notInStorage:
                return "No such cargo in the storage"
            case .noAvailableCourier:
                return "No available couriers at this moment"
            }
        }
    }
    
    var storage = [
        "Building material": Shipment(type: Cargo(name: "Building material"), weight: 200, destination: .NZ),
        "Caviar": Shipment(type: Cargo(name: "Caviar"), weight: 10, destination: .RU),
        "Hardware": Shipment(type: Cargo(name: "Hardware"), weight: 45, destination: .JP)
    ]

    var availableCourier = 0
    let ratio = 1.7

    func deliver(cargoName cargo: String) throws -> Cargo {
        guard let cargo = storage[cargo] else {throw CargoDeliveryError.notInStorage}
        guard availableCourier < 1 else { throw CargoDeliveryError.noAvailableCourier}
        
        let deliveryPrice = ratio * cargo.weight
        print("Price for \(cargo.type.name) delivery: \(deliveryPrice)")
        
        return cargo.type
    }

}

let storage = Storage()

do {
    let cardoOne = try storage.deliver(cargoName: "Caviar")
} catch Storage.CargoDeliveryError.notInStorage {
    print(Storage.CargoDeliveryError.notInStorage.localizedDescription)
} catch Storage.CargoDeliveryError.noAvailableCourier {
    print(Storage.CargoDeliveryError.noAvailableCourier.localizedDescription)
}

do {
    let cargoTwo = try storage.deliver(cargoName: "Tech")
} catch Storage.CargoDeliveryError.notInStorage {
    print(Storage.CargoDeliveryError.notInStorage.localizedDescription)
} catch Storage.CargoDeliveryError.noAvailableCourier {
    print(Storage.CargoDeliveryError.noAvailableCourier.localizedDescription)
}


 

