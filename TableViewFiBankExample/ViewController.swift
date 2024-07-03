import UIKit
//car parking
struct CarParking {
    var headerTitle: String
    var cars: [Car]
}

struct Car {
    var name: String
    var manufacturer: String
}

//car braket
struct CarBraket {
    var headerTitle: String
    var brakets: [Braket]
}

struct Braket {
    var name: String
    var amount: String
}

class ViewController: UIViewController {

    @IBOutlet var carDataTable: UITableView!

    var parking: [CarParking] = [
        CarParking(headerTitle: "Parking Section", cars: [
            Car(name: "Model S", manufacturer: "Tesla"),
            Car(name: "Aventador", manufacturer: "Lamborghini")
        ])
    ]

    var braket: [CarBraket] = [
        CarBraket(headerTitle: "Braket Section", brakets: [
            Braket(name: "Alto", amount: "5000"),
            Braket(name: "Swift", amount: "3000"),
            Braket(name: "Swift", amount: "3000"),
            Braket(name: "Swift", amount: "3000"),
            Braket(name: "Swift", amount: "3000"),
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        carDataTable.dataSource = self
        carDataTable.delegate = self
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return parking.count + braket.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < parking.count {
            return parking[section].cars.count
        } else {
            let braketSectionIndex = section - parking.count
            return braket[braketSectionIndex].brakets.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = carDataTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        if indexPath.section < parking.count {
            let car = parking[indexPath.section].cars[indexPath.row]
            cell.textDataLabel?.text = car.name
            cell.textdetailLabel?.text = car.manufacturer
        } else {
            let braketSectionIndex = indexPath.section - parking.count
            let braketItem = braket[braketSectionIndex].brakets[indexPath.row]
            cell.textDataLabel?.text = braketItem.name
            cell.textdetailLabel?.text = braketItem.amount
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < parking.count {
            print("parking----\(parking.count)")
            print("section----\(section)")
            return parking[section].headerTitle
        } else {
            let braketSectionIndex = section - parking.count
            print("braketSectionIndex----\(section - parking.count)")
            return braket[braketSectionIndex].headerTitle
        }
    }
}
