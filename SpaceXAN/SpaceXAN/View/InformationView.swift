//
//  InformationView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import SwiftUI




struct InformationView: View {
    var launchInfo : LaunchInfo
    var body: some View {
        VStack{
            Group{
            
            listItem(infoName: "Launch Date", data: launchInfo.date_local.convertToDate())
            listItem(infoName : "Launchpad",data: launchInfo.launchpad)
            listItem(infoName : "Rocket", data: launchInfo.rocket)
            listItem(infoName : "Flight Number", data: String(launchInfo.flight_number))
            listItem(infoName: "Landing Type", data: launchInfo.cores.last!.landing_type)
            listItem(infoName: "Landpad", data: launchInfo.cores.last!.landpad)
            listItem(infoName: "Flight", data: String(launchInfo.cores.last!.flight))
            listItem(infoName: "Landpad", data: launchInfo.cores.last!.landpad)
            }
            Group{
                    
                
            listItem(infoName: "Landing Attemp",
                     data: launchInfo.cores.last!.landing_attempt ? Status.Text.successText.rawValue : Status.Text.failText.rawValue,
                     withImage: true,
                     status: launchInfo.cores.last!.landing_attempt)
            listItem(infoName: "Landing Success",
                     data: launchInfo.cores.last!.landing_success ? Status.Text.successText.rawValue : Status.Text.failText.rawValue,
                     withImage: true,
                     status: launchInfo.cores.last!.landing_attempt)
            
            listItem(infoName: "Grifinds",
                     data: launchInfo.cores.last!.gridfins ? Status.Text.successText.rawValue : Status.Text.failText.rawValue,
                     withImage: true,
                     status: launchInfo.cores.last?.gridfins)
   
            }
            
            
        }.padding(.top, 15)
            
        
    }
    @ViewBuilder
    func listItem(infoName : String , data : String, withImage : Bool = false, status : Bool? = false) -> some View {
        HStack{
            VStack(alignment : .leading){
               
                Text(infoName)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.bottom, 2)
                Text(data)
                    .font(.caption)
            }.padding(.leading, 5)

            Spacer()
                        if withImage{
                            if let status = status {
                                Image(systemName: status ? Status.Image.successImage.rawValue : Status.Image.failedImage.rawValue)
                                    .foregroundColor(status ? .green : .red)
                            }
                        }
                
        }
        
        Divider()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(launchInfo: .fake)
    }
}



