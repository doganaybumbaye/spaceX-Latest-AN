//
//  FailuresView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import SwiftUI

struct FailuresView: View {
    var launchFailures : LaunchInfo
    var body: some View {
        if !launchFailures.failures.isEmpty{
            if let reason = launchFailures.failures.last?.reason{
                Text(reason)
                    .padding()
            }else{
                HStack{
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                        
                    Text("Reason is not specified")
                }.padding()
                .opacity(0.5)
            }
        }else{
            HStack{
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                Text("Failures are not specified")


            }.padding()
            .opacity(0.5)
        }
    }
}

struct FailuresView_Previews: PreviewProvider {
    static var previews: some View {
        FailuresView(launchFailures: .fake)
    }
}



