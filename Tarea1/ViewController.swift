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
            performSegue(withIdentifier: "toGame", sender: nil)
        }else{
            //Guardar el user name
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

