//
//  ViewController.swift
//  ToDoApp
//
//  Created by 御前政喜 on 2023/09/08.
//

import UIKit
import RealmSwift

class ViewController: UIViewController ,UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    
    var items: [TodoItem] = []
    var edit_data: TodoItem?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          edit_data  = self.items[indexPath.row]
          
          self.performSegue(withIdentifier: "toNewItemView", sender: nil)
      }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)as! ItemTableViewCell
        let item: TodoItem = items[indexPath.row]
        cell.setCell(title: item.title, times: item.timeDate, isMarked: item.isMarked)
        
        return cell
    }
    
    func readItems() -> [TodoItem]{
        return Array(realm.objects(TodoItem.self))
    }
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                
                try realm.write {
                    realm.delete(self.items[indexPath.row])
                }
                
            }catch{
            }
            items = readItems()
            tableView.reloadData()
        }
    }
   
    
    
}
