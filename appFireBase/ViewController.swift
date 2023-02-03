//
//  ViewController.swift
//  appFireBase
//
//  Created by Matin Hoshimov on 01.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        return table
//    }()
//
//    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "To Do List"
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.frame = view.bounds
        
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = models[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = model.name
//
//        return cell
//    }
//
//
//    //MARK: Core Data
//
//    func getAllItems(){
//        do {
//             models = try context.fetch(ToDoListItem.fetchRequest())
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//        catch {
//
//        }// error
//    }
//
//    func createItem(name: String){
//        let newItem = ToDoListItem(context: context)
//        newItem.name = name
//        newItem.createdAt = Date()
//
//        do {
//            try context.save()
//        }
//        catch{
//
//        }
//    }
//
//    func deleteItem(item: ToDoListItem){
//        context.delete(item)
//
//        do {
//            try context.save()
//        }
//        catch{
//
//        }
//    }
//
//    func updateItem(item: ToDoListItem, newName: String){
//        item.name = newName
//        do {
//            try context.save()
//        }
//        catch{
//
//        }
//    }
    
    
    
    
    @IBAction func logoutAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print (error)
        }
    }
    
}

