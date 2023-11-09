//
//  PuntiationViewController.swift
//  Tarea1
//
//  Created by user201171 on 11/4/23.
//

import UIKit

var ids: [String] = []

class PuntiationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     
    @IBOutlet var gameDataTableView: UITableView!
    
    let saved = UserDefaults.standard
    
    let url = URL(string: "https://api.restful-api.dev/objects")
    
    var gameData: [GameData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sevedArray = UserDefaults.standard.stringArray(forKey: "miArrayString") {
            ids = sevedArray
            
        }
        
        let userName = saved.string(forKey: "Name")
        let score = saved.integer(forKey: "Puntuation")
        let newGame = GameData(userName ?? "Name", GameInfo(userName ?? "Name", score))
        postGame(lesson: newGame)
        
        
        
        //gameDataTableView.reloadData()
        gameDataTableView.delegate = self
        gameDataTableView.dataSource = self
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "puntuation") as! TableCell
        let gameInfo = gameData[indexPath.row].data
        //let cell = UITableViewCell()
        
        cell.userNameView.text = gameInfo.userName
        cell.scoreView.text = String(gameInfo.score)
        
        return cell
    }
    
    func postGame(lesson: GameData) {
            print("Post game")

            let data = try! JSONEncoder().encode(lesson)
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                let json = String(data: data!, encoding: .utf8)
                print(json ?? "Error")
                do {
                    let gameDataJSON = try JSONDecoder().decode(GameData.self, from: data!)
                    
                        ids.append(gameDataJSON.id)
                        let seveArray = Array(ids)
                        UserDefaults.standard.set(seveArray, forKey: "miArrayString")
                        UserDefaults.standard.synchronize()
                    
                    
                    DispatchQueue.main.async { // ejecutar código en el hilo principal
                        self.getGame()

                        
                    }
                } catch {
                    print("Error parseo JSON")
                }
            }.resume()
    

    }
    func getGame() {
            print("Get game")

            let url = URL(string: generateURL())
            

            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                let json = String(data: data!, encoding: .utf8)
                print(json ?? "Error")
                if let jsonData = data {
                    // Aquí puedes imprimir los datos brutos para depuración
                    print("--> ",String(data: jsonData, encoding: .utf8)!)
                }
                do {
                    let gameDataJSON = try JSONDecoder().decode([GameData].self, from: data!)
                    self.gameData = gameDataJSON
                    DispatchQueue.main.async { // ejecutar código en el hilo principal
                        self.gameData.sort { $0.data.score > $1.data.score }
                        self.gameDataTableView.reloadData()
                        ids.removeAll()

                        
                        
                    }
                } catch let error {//cometario
                    print("Error parseo JSON: \(error)")
                }
            }.resume()
    }
    func generateURL() -> String {
        //Cargar preferencia aqui
        
        
        var url = "https://api.restful-api.dev/objects?"
        
        for id in ids {
            url += "id=" + id + "&"
            
        }
           url.removeLast()
           return url
    }
    
}
