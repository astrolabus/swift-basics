import Foundation

protocol Volumable {
    var volume: Double { get }
}

struct Queue<T: Volumable> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func returnSortedVolumes() -> [Double] {
        var tempArray: [Double] = []
        
        for element in elements {
            tempArray.append(element.volume)
        }
        
        return tempArray.sorted(by: {$0 < $1})
    }
    
    func returnFormattedVolumes() -> [String] {
        var tempArray: [Double] = []
        
        for element in elements {
            tempArray.append(element.volume)
        }
        
        return tempArray.map( {String(format: "Figure volume: %.2f", $0)} )
    }
}

class Sphere: Volumable {
    var radius: Double
    var volume: Double {
        return 4/3 * .pi * pow(radius, 3)
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Cylinder: Volumable {
    var radius: Double
    var height: Double
    
    var volume: Double {
        return .pi * pow(radius, 2) * height
    }
    
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
    }
}

var sphereQueue = Queue<Sphere>()

sphereQueue.push(Sphere(radius: 3))
sphereQueue.push(Sphere(radius: 5))
sphereQueue.push(Sphere(radius: 7))
sphereQueue.push(Sphere(radius: 9))

sphereQueue.pop()

sphereQueue.returnSortedVolumes()
sphereQueue.returnFormattedVolumes()

var cylinderQueue = Queue<Cylinder>()

cylinderQueue.push(Cylinder(radius: 2, height: 4))
cylinderQueue.push(Cylinder(radius: 6, height: 12))
cylinderQueue.push(Cylinder(radius: 9, height: 8))
cylinderQueue.push(Cylinder(radius: 3, height: 10))

cylinderQueue.pop()

cylinderQueue.returnSortedVolumes()
cylinderQueue.returnFormattedVolumes()
