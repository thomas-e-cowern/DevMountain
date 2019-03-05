import UIKit

protocol Currency {
    func symbol() -> String
    func code() -> String
}

class Euro: Currency {
    func symbol() -> String {
        return "€"
    }
    
    func code() -> String {
        return "EUR"
    }
}

class UnitedStatesDollar: Currency {
    func symbol() -> String {
        return "$"
    }
    
    func code() -> String {
        return "USD"
    }
}

class Yen: Currency {
    func symbol() -> String {
        return "¥"
    }
    
    func code() -> String {
        return "YEN"
    }
}


enum Country {
    case unitedStates
    case spain
    case japan
    case greece
}

var currentCountry: Country = .japan

class CurrencyFactory {
    static func mintCurrency(for country: Country) -> Currency{
        switch  country {
        case .unitedStates:
            return UnitedStatesDollar()
        case .spain, .greece:
            return Euro()
        case .japan :
            return Yen()
        }
    }
}

let currency = CurrencyFactory.mintCurrency(for: currentCountry)
print(currency.code())
print(currency.symbol())
