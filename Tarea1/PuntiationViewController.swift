//
//  PuntiationViewController.swift
//  Tarea1
//
//  Created by user201171 on 11/4/23.
//

import UIKit

class PuntiationViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet var NameView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let userName = userDefaults.string(forKey: "Name") {
            //Llamamos el nombre que guardamos en otra vista
            NameView.text = userName
        }
        
        
    }
}
