//
//  NetworkService.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import Foundation


class NetworkService{
    static let shared = NetworkService()
    let latestURL = URL(string: "https://api.spacexdata.com/v4/launches/latest")!

    func getLaunchInformation(completion : @escaping (LaunchInfo) -> ()){
        
        URLSession.shared.dataTask(with: latestURL) { (data, response , error) in
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data {
                let lastLaunch = try! JSONDecoder().decode(LaunchInfo.self, from: data)
                
                LaunchInfo.fake = lastLaunch
                
                completion(lastLaunch)
            }
            
        }.resume()
        
    }
    
 }
    
    

    
    
    


