//
//  DetailsView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import SwiftUI

struct DetailsView: View {
    var launchDetails : LaunchInfo
    var body: some View {
        if let details = launchDetails.details {
            VStack{
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    
                Text(details)
            }.padding()
                
        }else{
            HStack{
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    
                Text("Details are not specified.")
            }.padding()
            .opacity(0.5)
            
            
        }
        
        
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(launchDetails: .fake)
    }
}
