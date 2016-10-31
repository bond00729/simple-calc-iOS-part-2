//
//  HistoryTableViewController.swift
//  SimpleCalciOSPart2
//
//  Created by Matt Bond on 10/30/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    private var history = HistoryTableViewController.getHistory()
    
    private static func getHistory() -> [Any] {
        let history = UserDefaults.standard.array(forKey: "history")
        if history == nil {
            return Array()
        } else {
            return history!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.history = HistoryTableViewController.getHistory()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.history.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)

        // Configure the cell...
        let currentCell = self.history[indexPath.row]
        cell.textLabel?.text = currentCell as? String
        
        return cell
    }

    @IBAction func doneButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.history.remove(at: indexPath.row)

            var array = HistoryTableViewController.getHistory()
            array.remove(at: indexPath.row)
            UserDefaults.standard.set(array, forKey: "history")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
