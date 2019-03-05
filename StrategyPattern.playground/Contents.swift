import UIKit

protocol AttackStrategy {
    func attack()
    func defend()
}

class WaterAttackStrategy: AttackStrategy {
    func attack() {
        print("Water Attack")
    }
    
    func defend() {
        print("Water Defense")
    }
}

class LightningAttackStrategy: AttackStrategy {
    func attack() {
        print("Lightning Attack")
    }
    
    func defend() {
        print("Lightning Defense")
    }
}

class FireAttackStrategy: AttackStrategy {
    func attack() {
        print("🔥🔥🔥🔥🔥")
    }
    
    func defend() {
        print("🧯🧯🧯🧯🧯")
    }
}

protocol TravelStrategy {
    func travel()
}

class FlyingTravelStrategy: TravelStrategy {
    func travel() {
        print("I'm flying")
    }
}
    
class WalkTravelStrategy: TravelStrategy {
    func travel() {
        print("I'm walking")
    }
}
        
class SwimTravelStrategy: TravelStrategy {
    func travel() {
        print("I'm swimming")
    }
}

class Pokemon {
    
    private var attackStrategy: AttackStrategy
    private var travelStrategy: TravelStrategy
    
    init(attackStrategy: AttackStrategy, travelStrategy: TravelStrategy) {
        self.attackStrategy = attackStrategy
        self.travelStrategy = travelStrategy
    }
    
    public func attack() {
        attackStrategy.attack()
    }
    
    public func defend() {
        attackStrategy.defend()
    }
    
    public func travel() {
        travelStrategy.travel()
    }
}

let volpix = Pokemon(attackStrategy: FireAttackStrategy(), travelStrategy: WalkTravelStrategy())
let zaptos = Pokemon(attackStrategy: LightningAttackStrategy(), travelStrategy: FlyingTravelStrategy())
let pikachu = Pokemon(attackStrategy: LightningAttackStrategy(), travelStrategy: WalkTravelStrategy())
let squirtle = Pokemon(attackStrategy: WaterAttackStrategy(), travelStrategy: SwimTravelStrategy())

let pokemons = [volpix, zaptos, pikachu, squirtle]


for pokemon in pokemons {
    pokemon.attack()
    pokemon.travel()
    pokemon.defend()
}
