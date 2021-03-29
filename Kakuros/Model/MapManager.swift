//
//  NetworkManager.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import Foundation



struct MapManager{
    
    
    func GetMap(){
        let endpoint = URL(string:"https://kakuro-gamemap-api.herokuapp.com/sendmap/cebd1c66-4013-4de4-bb60-6cb0ffc1eff2")

        let session  = URLSession(configuration: .default)
        let task = session.dataTask(with: endpoint!) { (data, response, error) in
            if let e = error{
                print(e.localizedDescription)
                return
            }
            if let safeData = data{
let finalMap = parseJSON(data: safeData)
                (finalMap)
            }
        }
        task.resume()
    }
    
    func parseJSON(data:Data)->MapModel?{
        let decoder = JSONDecoder()
        do{
            let finalData = try decoder.decode(MapModel.self, from: data)
            return finalData
        }catch{
            print(error.localizedDescription)
            return nil
        }
        
    }
    
   
}
