//
//  GameViewController.swift
//  Tarea1
//
//  Created by user201171 on 10/18/23.
//

import UIKit

class GameViewController: UIViewController {
    
    // Declaracion de variables, imagenes y botones
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet var ImageView: UIImageView!
    
    
    let imagenes = [UIImage(named: "Rayo"),UIImage(named: "Azul"),UIImage(named: "Amarillo"),UIImage(named: "Xocas")]
    let num = [0, 1, 2, 3]
    
    var numShuffle: [Int] = []
    var currentIndex = 0
    var timer: Timer = Timer()
    var playerSequence: [Int] = []
    var score: Int = 0
    
    @IBOutlet var ImageStackView: UIStackView!
    @IBOutlet var MainImageView: UIImageView!
    @IBOutlet var ButtonPuntuationView: UIButton!
    // Boton para saltar a una vista donde esta la puntuacion
    @IBAction func PuntuationView(_ sender: Any) {
        
        performSegue(withIdentifier: "toPuntuation", sender: nil)
        
    }
    // Override donde encender/apagar botones e imagenes, llamada de timer y dar valores, llamar showNextImage
    override func viewDidLoad() {
           super.viewDidLoad()
        
        ButtonPuntuationView.isEnabled = false
        ImageStackView.isHidden = true
        numShuffle = num.shuffled()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(showNextImage), userInfo: nil, repeats: true)
        
            
            showNextImage()
                    
    }
    
    @objc func showNextImage() {
        //Compara el index con la lista de shuffle
        if currentIndex == numShuffle.count {
            timer.invalidate() //Detener el temporizador
            ImageStackView.isHidden = false
            MainImageView.isHidden = true
            return
        }
        //Muesta las imagenes que todavia no han salido y suma mas 1 al currentIndex
        ImageView.image = imagenes[numShuffle[currentIndex]]
        print(currentIndex)
        currentIndex += 1
        
    }
    
    @IBAction func OnButtonTap(_ sender: UIButton) {
        //For donde pulsamos los botones, los pone en enabled-false y añade en la lista de playerSequence
        for i in 0 ..< Buttons.count{
            if Buttons[i] == sender{
                Buttons[i].isEnabled = false
                playerSequence.append(i)
                
            }
            ButtonPuntuationView.isEnabled = true
        }
        print(playerSequence)
        
    }
    
    func puntuation(){
        
        for i in 0 ..< playerSequence.count {
            if numShuffle[i] == playerSequence[i]{
                score += 20
                print(score)
            }else{
                score -= 5
                print(score)
            }
        }
        
    }
}


