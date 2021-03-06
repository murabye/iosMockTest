//
//  DisplayController.swift
//  TestExample4
//
//  Created by варя on 16/10/2018.
//  Copyright © 2018 Вова Петров. All rights reserved.
//

import UIKit
import CoreData

class DisplayController: UITableViewController {
    var filteredEmployees:[Person]?
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            filteredEmployees = try PersistenceService.context.fetch(request)
        } catch {
            filteredEmployees = []
        }
    }
    
    @IBAction func segmentDidChange(_ sender: Any) {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        do {
            filteredEmployees = try PersistenceService.context.fetch(request)
        } catch {
            filteredEmployees = []
        }
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            break
        case 1:
            filteredEmployees = filteredEmployees?.filter({ (employee) -> Bool in
                return employee.status
            })
        case 2:
            filteredEmployees = filteredEmployees?.filter({ (employee) -> Bool in
                return !employee.status
            })
        default:
            break
        }
        tableView.reloadData()
    }
    
    //MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredEmployees?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: nil)
        
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "Имя"
            cell.detailTextLabel!.text = filteredEmployees![indexPath.section].name
        case 1:
            cell.textLabel!.text = "Должность"
            cell.detailTextLabel!.text = filteredEmployees![indexPath.section].post
        case 2:
            cell.textLabel!.text = "Статус"
            cell.detailTextLabel!.text = filteredEmployees![indexPath.section].status ? "Активен" : "Неактивен"
        case 3:
            cell.textLabel!.text = "Зарплата"
            cell.detailTextLabel!.text = String(filteredEmployees![indexPath.section].wage) + "Р"
        case 4:
            cell.textLabel!.text = "Опыт при приеме"
            cell.detailTextLabel!.text = filteredEmployees![indexPath.section].exp ? "Был" : "Не был"
        case 5:
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "ru_RU")
            
            cell.textLabel!.text = "Дата приема"
            cell.detailTextLabel!.text = dateFormatter.string(from: filteredEmployees![indexPath.section].startDate! as Date)
        default:
            break
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
