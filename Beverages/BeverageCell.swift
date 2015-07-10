
import UIKit

let Padding = 10

public class BeverageCell: UITableViewCell {
    var beverage: Beverage?

    lazy public var beverageEmojiLabel: UILabel = {
        let label = UILabel(frame: .zeroRect)
        label.font = UIFont.systemFontOfSize(25)
        return label
    }()

    lazy public var beverageNameLabel: UILabel = {
        let label = UILabel(frame: .zeroRect)
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        return label
    }()

    lazy public var amountDrunkLabel: UILabel = {
        let label = UILabel(frame: .zeroRect)
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        return label
    }()

    lazy public var stepper: UIStepper = {
        let stepper = UIStepper(frame: .zeroRect)
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.addTarget(self, action: "stepperStepped:", forControlEvents: .ValueChanged)
        return stepper
    }()


    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(beverageEmojiLabel)
        contentView.addSubview(beverageNameLabel)
        contentView.addSubview(stepper)
        contentView.addSubview(amountDrunkLabel)
    }

    public func configure(beverage: Beverage) {
        self.beverage = beverage
        beverageEmojiLabel.text = beverage.emoji
        beverageNameLabel.text = beverage.description
        stepper.value = Double(beverage.unitsDrunk)
        updateAmountDrunkLabel()
    }

    public func stepperStepped(stepper: UIStepper) {
        if var beverage = beverage {
            beverage.unitsDrunk = Int(stepper.value)
            updateAmountDrunkLabel()
        }
    }

    func updateAmountDrunkLabel() {
        if let beverage = beverage {
            amountDrunkLabel.text = "\(beverage.unitsDrunk) drunk today"
        }
    }

    // MARK: Layouting

    override public func layoutSubviews() {
        super.layoutSubviews()

        // beverageEmojiLabel
        let emojiSize = beverageEmojiLabel.sizeThatFits(CGSize(width: 1000, height: 0))
        beverageEmojiLabel.frame = CGRect(x: Padding, y: Padding, width: Int(emojiSize.width), height: Int(contentView.frame.size.height) - 2 * Padding)

        // stepper
        let stepperWidth = Int(stepper.frame.size.width)
        let stepperHeight = Int(stepper.frame.size.height)
        stepper.frame = CGRect(x: Int(contentView.frame.size.width) - Padding - stepperWidth, y: Padding, width: stepperWidth, height: stepperHeight)

        // beverageNameLabel
        let rightSpace = Padding + Int(beverageEmojiLabel.frame.size.width) + Int(beverageEmojiLabel.frame.origin.x) + Padding
        let leftSpace = stepperWidth + Padding
        let maxWidth = Int(contentView.frame.size.width) - rightSpace + leftSpace
        let labelSize = beverageNameLabel.sizeThatFits(CGSize(width: maxWidth, height: 1000))
        beverageNameLabel.frame = CGRect(x: rightSpace, y: Padding, width: maxWidth, height: Int(labelSize.height))

        // amountDrankLabel
        let beverageNameLabelBottom = Int(beverageNameLabel.frame.origin.y + beverageNameLabel.frame.size.height)
        let amountDrunkSize = amountDrunkLabel.sizeThatFits(CGSize(width: maxWidth, height: 1000))
        amountDrunkLabel.frame = CGRect(x: rightSpace, y: beverageNameLabelBottom, width: maxWidth, height: Int(amountDrunkSize.height))
    }

    // MARK: Rubbish

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
