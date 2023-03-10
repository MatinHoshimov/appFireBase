//
//  AuthViewController.swift
//  appFireBase
//
//  Created by Matin Hoshimov on 01.02.2023.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    var signup =  true {
        willSet{
            if newValue{
                titleLabel.text = "Регистрация"
                nameField.isHidden = false
                enterButton.setTitle("Войти", for: .normal)
            }else{
                titleLabel.text = "Вход "
                nameField.isHidden = true
                enterButton.setTitle("Регистрация ", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
//       nextBtn.addTarget(self, action: #selector(NextButtonClick), for: .touchUpInside)

    }
    
    @IBAction func NextButtonСlick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ToDoListViewController") as! ToDoListViewController
        print("hello")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//        @objc func NextButtonClick(){
//            print("!!!")
//
//        }

    @IBAction func switchLogin(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

extension AuthViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if (signup){
            if (!name.isEmpty && !email.isEmpty && !password.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password){(result, error) in
                    if error == nil{
                        if let result = result{
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")  /// создаем ссылку на базу
                            ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email ]) ///Добавляем user по id
                            self.dismiss(animated: true, completion: nil)
                            
                        }
                    }
                }
                
            }else {
                showAlert()
            }
        }else {
            if(!email.isEmpty && !password.isEmpty){
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil{
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
                
            }else {
                showAlert()
            }
             
        }
        
        return true
    }
}
