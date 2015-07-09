import XCTest
import Beverages

class BeveragesTests: XCTestCase {
    func testBeer() {
        let subject = Beverage.Beer
        XCTAssertEqual(subject.amount, 0.5)
        XCTAssertEqual(subject.description, "Beer (0.5 l)")
        XCTAssertEqual(subject.emoji, "🍺")
    }

    func testBeers() {
        let subject = Beverage.Beers
        XCTAssertEqual(subject.amount, 1)
        XCTAssertEqual(subject.description, "Large Beer (1.0 l)")
        XCTAssertEqual(subject.emoji, "🍻")
    }

    func testWine() {
        let subject = Beverage.Wine
        XCTAssertEqual(subject.amount, 0.2)
        XCTAssertEqual(subject.description, "Wine (0.2 l)")
        XCTAssertEqual(subject.emoji, "🍷")
    }

    func testCocktail() {
        let subject = Beverage.Cocktail
        XCTAssertEqual(subject.amount, 0.2)
        XCTAssertEqual(subject.description, "Cocktail (0.2 l)")
        XCTAssertEqual(subject.emoji, "🍸")
    }

    func testSmoothie() {
        let subject = Beverage.Smoothie
        XCTAssertEqual(subject.amount, 0.33)
        XCTAssertEqual(subject.description, "Smoothie (0.33 l)")
        XCTAssertEqual(subject.emoji, "🍹")
    }

    func testMilk() {
        let subject = Beverage.Milk
        XCTAssertEqual(subject.amount, 0.25)
        XCTAssertEqual(subject.description, "Milk (0.25 l)")
        XCTAssertEqual(subject.emoji, "🍼")
    }

    func testCoffee() {
        let subject = Beverage.Coffee
        XCTAssertEqual(subject.amount, 0.25)
        XCTAssertEqual(subject.description, "Coffee (0.25 l)")
        XCTAssertEqual(subject.emoji, "☕️")
    }

    func testTea() {
        let subject = Beverage.Tea
        XCTAssertEqual(subject.amount, 0.25)
        XCTAssertEqual(subject.description, "Tea (0.25 l)")
        XCTAssertEqual(subject.emoji, "🍵")
    }

    func testSettingAmountDrunk() {
        var subject = Beverage.Tea
        subject.unitsDrunk = 0
        XCTAssertEqual(subject.unitsDrunk, 0)
        subject.unitsDrunk = 5
        XCTAssertEqual(subject.unitsDrunk, 5)

        // Take other instance of tea and check if same amount applies
        let secondSubject = Beverage.Tea
        XCTAssertEqual(subject.unitsDrunk, 5)
    }
}
