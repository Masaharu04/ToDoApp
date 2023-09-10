//
//  NextViewController.swift
//  ToDoApp
//
//  Created by 御前政喜 on 2023/09/08.
//

import UIKit
import RealmSwift

class NextViewController: UIViewController {
    
    let realm = try! Realm()
   
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        
        let item = TodoItem()
        let dt = Date()
        let dateFormatter = DateFormatter()

        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))

        item.title = titleTextField.text ?? ""
        item.isMarked = markSwitch.isOn
        item.timeDate = dateFormatter.string(from: dt)
        creatItem(item: item)
        
        self.dismiss(animated: true)
    }
    

    func creatItem(item: TodoItem){
        try! realm.write{
            realm.add(item)
        }
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
