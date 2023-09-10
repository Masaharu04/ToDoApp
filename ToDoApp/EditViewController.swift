//
//  EditViewController.swift
//  ToDoApp
//
//  Created by 御前政喜 on 2023/09/10.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    let realm = try! Realm()
    var items: [TodoItem] = []
    var selected: TodoItem!

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        try! realm.write{
            selected.title = titleTextField.text ?? ""
            selected.isMarked = markSwitch.isOn

        }
        
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
