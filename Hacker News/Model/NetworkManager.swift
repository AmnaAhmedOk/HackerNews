//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Amna on 11/20/20.
//  Copyright © 2020 Amna. All rights reserved.
//

import Foundation

class NetworkManager : ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetchData (){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try decoder.decode(PostData.self, from: safeData)
                            print(result.hits.count)
                            DispatchQueue.main.async {
                                self.posts = result.hits

                            }
            

                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
