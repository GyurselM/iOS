//
//  GameData.swift
//  Tarea1
//
//  Created by user201171 on 11/7/23.
//

import Foundation

public class GameData: Codable{
    
    var id: String = ""
    var name: String
    var data: GameInfo
    
    init(_ name: String, _ data: GameInfo) {
            self.name = name
            self.data = data
        }
  
}
class GameInfo: Codable {
    
    var userName: String
    var score: Int

    init( _ userName: String,_ score: Int) {
        self.userName = userName
        self.score = score
        
    }
}
