import FBSnapshotTestCase
import Beverages

class BeverageCellTests: FBSnapshotTestCase {
    func testCellConfiguration() {
        var beverage = Beverage.Beer
        beverage.unitsDrunk = 3
        let subject = BeverageCell(style: .Default, reuseIdentifier: nil)
        subject.configure(beverage)

        XCTAssertEqual(subject.beverageEmojiLabel.text!, "🍺")
        XCTAssertEqual(subject.beverageNameLabel.text!, "Beer (0.5 l)")
        XCTAssertEqual(subject.amountDrunkLabel.text!, "3 drunk today")
        XCTAssertEqual(subject.stepper.value, 3)

        FBSnapshotVerifyView(subject)
    }

    func testStepper() {
        var beverage = Beverage.Beers
        beverage.unitsDrunk = 0

        let subject = BeverageCell(style: .Default, reuseIdentifier: nil)
        subject.configure(beverage)

        // Set stepper value
        subject.stepper.value = 5
        subject.stepperStepped(subject.stepper)

        // Expect that the amount drunk label has the right value
        XCTAssertEqual(subject.amountDrunkLabel.text!, "5 drunk today")
    }
}
