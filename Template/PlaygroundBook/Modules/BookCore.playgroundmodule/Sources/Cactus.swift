import Foundation

struct LifeCycle {
    
    enum Life {
        case Seed
        case Bud
        case Growth
        case Adult
        case Dead
    }
    
    var step: Life = .Seed
    
    mutating func growUp(){
        switch step {
            case .Seed:
                self = LifeCycle(step: .Bud)
            case .Bud:
                self = LifeCycle(step: .Growth)
            case .Growth:
                self = LifeCycle(step: .Adult)
            case .Adult:
                self = LifeCycle(step: .Adult)
            case .Dead:
                self = LifeCycle(step: .Seed)
        }
    }
    
    mutating func dead(){
        self = LifeCycle(step: .Dead)
    }
}

public enum CactisTypes{
    case Mammillaria
    case CephalocereusSenilis
    case ChamaecereusSilvestrii

    var water: Int {
        switch self {
            case .Mammillaria:
                return 5
            case .CephalocereusSenilis:
                return 5
            case .ChamaecereusSilvestrii:
                return 5
        }
    }

    var sun: Int {
        switch self {
            case .Mammillaria:
                return 2
            case .CephalocereusSenilis:
                return 2
            case .ChamaecereusSilvestrii:
                return 2
        }
    }
}

public class Cacti {
    var type: CactisTypes
    var life: LifeCycle = LifeCycle()

    init(type: CactisTypes) {
        self.type = type
        self.plant()
    }
    
    public func replant(type: CactisTypes){
        self.type = type
        self.life = LifeCycle()
        self.plant()
    }
    
    private func plant(){
        self.life.growUp()
    }
    
    public func irrigate(with water: Int){
        let diference = type.water - water

        diference.magnitude > 3 ? self.life.dead() : self.life.growUp()

    }
    
    public func food(with sun: Int){
        let diference = type.sun - sun

        diference.magnitude > 3 ? self.life.dead() : self.life.growUp()
    }
}


