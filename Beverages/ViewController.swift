import UIKit

class ViewController: UITableViewController {
    let cellIdentifier = "CellIdentifier"
    lazy var beverages: [Beverage] = {
        return [.Beer, .Beers, .Wine, .Cocktail, .Smoothie, .Milk, .Coffee, .Tea]
    }()


    override init(style: UITableViewStyle) {
        super.init(style: style)
        title = "Nutrition, Yo!"
        tableView.registerClass(BeverageCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverages.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! BeverageCell

        let beverage = beverages[indexPath.row]
        cell.configure(beverage)

        return cell
    }

    // MARK: rubbish

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }

    override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
}

