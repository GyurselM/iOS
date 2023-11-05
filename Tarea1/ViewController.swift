//
//  ViewController.swift
//  Tarea1
//
//  Created by user201171 on 10/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var NameTextField: UITextField!
    @IBAction func Game(_ sender: Any) {
        //Comprobamos que en el campo este el nombre para poder dar al boton
        let userName = NameTextField.text
        if userName?.isEmpty == false {
            //Pasar a la siguiente vista
            performSegue(withIdentifier: "toGame", sender: nil)
            
            //Guardar el user name en UserDefaults
            userDefaults.set(userName, forKey: "Name")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

