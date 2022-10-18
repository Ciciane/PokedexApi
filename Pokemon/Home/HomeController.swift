//
//  HomeController.swift
//  Pokemon
//
//  Created by user217410 on 10/17/22.
//

import Foundation
import UIKit
import Alamofire

class HomeController: UIViewController {
    
    let url = "https://pokeapi.co/api/v2/pokemon/pikachu"
    
    func getRequest(url: String,
                    completion: @escaping ([String: Any]?, Error?) -> Void){
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
    
        let request = NSMutableURLRequest(url: URL)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                
                if let data = data {
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response as? [String : Any], nil)
                    print("Sua requisicao foi realizada com sucesso: \n \(response)")
                }
                else {
                    completion(nil, nil)
                }
            } catch let error as NSError {
                completion(nil, error)
            }
        }
        task.resume()
        
    }
    /*getRequest(url: url){
        (response, erro)  in
          if(response != nil) {
              //O resultado aqui vem como Opcional
              print("Sua requisicao foi realizada com sucesso: \n \(resultado)")
          } else {
              print("A requisicao nao funcionou")
          }
          
    }*/
   
}
