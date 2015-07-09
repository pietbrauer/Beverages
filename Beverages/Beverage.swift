import Foundation

public enum Beverage: String, Printable {
    case Beer = "Beer", Beers = "Large Beer", Wine = "Wine", Cocktail = "Cocktail", Smoothie = "Smoothie", Milk = "Milk", Coffee = "Coffee", Tea = "Tea"

    public var description: String {
        return "\(self.rawValue) (\(amount) l)"
    }

    public var amount: Float {
        switch self {
        case .Beer:
            return 0.5
        case .Beers:
            return Beverage.Beer.amount * 2
        case .Wine, .Cocktail:
            return 0.2
        case .Smoothie:
            return 0.33
        case .Milk, .Coffee, .Tea:
            return 0.25
        }
    }

    public var unitsDrunk: Int {
        get {
            return NSUserDefaults.standardUserDefaults().integerForKey(rawValue)
        }
        set {
            NSUserDefaults.standardUserDefaults().setInteger(newValue, forKey: rawValue)
        }
    }

    public var emoji: String {
        switch self {
        case .Beer:
            return "🍺"
        case .Beers:
            return "🍻"
        case .Wine:
            return "🍷"
        case .Cocktail:
            return "🍸"
        case .Smoothie:
            return "🍹"
        case .Milk:
            return "🍼"
        case .Coffee:
            return "☕️"
        case .Tea:
            return "🍵"
        }
    }
}
