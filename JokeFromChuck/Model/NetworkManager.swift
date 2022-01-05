//
//  NetworkManager.swift
//  JokeFromChuck
//
//  Created by MacBook on 03.04.2021.
//

import Foundation
struct NetworkManager {
    func getRandomJoke(block:(_ textJoke:String)->Void){
        if let urlRandomJoke = URL(string: "https://api.icndb.com/jokes/random") {
            if let dataJson = try? Data(contentsOf: urlRandomJoke) {
                if let jsonDict = try? JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions.allowFragments) {
                    if let joke = ((jsonDict as! NSDictionary).object(forKey:"value")as! NSDictionary).object(forKey: "joke") as? String {
                        block(joke.replacingOccurrences(of: "&quot;", with: "\""))
                        print(joke,  UTF8())
                        return 
                    }
                }
            }
        }
    block("")
    }
}
