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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toNewItemView"{
                let editVC = segue.destination as! NextViewController
                          editVC.selectedTodo = sender as? TodoModel
            }
        }
    /*
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1
        items.remove(at: indexPath.row)
        
        // 2
        let indexPaths = [indexPath]
        var sakujo = indexPath
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        do{
            
            try! self.realm.write{
                self.realm.delete(self.items[indexPath.row])
            }
        }
        
        self.items = self.readItems()
        self.tableView.reloadData()
        
    
    }
     */
    
}

extension ViewController: UITableViewDelegate {
  // スワイプした時に表示するアクションの定義
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    // 編集処理
    let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
      // 編集処理を記述
      print("Editがタップされた")

    // 実行結果に関わらず記述
    completionHandler(true)
    }
      
   // 削除処理
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
      //削除処理を記述
      print("Deleteがタップされた")
        do{
            
            try! self.realm.write{
                self.realm.delete(self.items[indexPath.row])
            }
        }
        
        self.items = self.readItems()
        self.tableView.reloadData()
        
      // 実行結果に関わらず記述
      completionHandler(true)
    }

    // 定義したアクションをセット
    return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
  }
}
