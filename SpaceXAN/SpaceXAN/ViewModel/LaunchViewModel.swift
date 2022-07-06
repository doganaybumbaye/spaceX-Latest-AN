//
//  LaunchViewController.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import Foundation

class LaunchViewModel: ObservableObject {

    @Published var result : LaunchInfo = .fake

    func fetchAll(){
        NetworkService.shared.getLaunchInformation { info in
            DispatchQueue.main.async {
                self.result = info
            }
            
        }
        
    }
    


}
