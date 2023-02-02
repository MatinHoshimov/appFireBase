//
//  ViewController.swift
//  appFireBase
//
//  Created by Matin Hoshimov on 01.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logoutAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print (error )
        }
    }
    
}

