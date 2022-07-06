//
//  InfoView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import SwiftUI

struct InfoView: View {
    var latestLaunchDetails : LaunchInfo
    
    var body: some View {
        
                    VStack(alignment : .leading){
                        HStack{
                            Text("Mission")
                                .font(.caption)
                            if latestLaunchDetails.success == true{
                                Image(systemName: latestLaunchDetails.success ? "checkmark.circle.fill" : "multiply.circle.fill")
                                    .foregroundColor(latestLaunchDetails.success ? .green : .red)
                            }else{
                                Image(systemName:"checkmark")
                                    .foregroundColor(.green)
                            }
                            
                            
                            Spacer()
                            Image(systemName: "clock")
                                .font(.caption)
                            Text(latestLaunchDetails.date_unix.calculateDates())
                                .font(.caption)
                        }
                        .padding()
                        .cornerRadius(36)
                            .foregroundColor(.gray)
                        
                        Divider()
                        HStack{
                            AsyncImage(url: URL(string: latestLaunchDetails.links.patch.small)) { phase in
                                switch phase {
                                case .empty:
                                    LottieView(name: "Loading", loopMode: .loop)
                                        .frame(maxWidth: 80, maxHeight: 80)
                                case .success(let image):
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 80, maxHeight: 80)
                                case .failure:
                                    Image(systemName: "photo")
                                default:
                                    EmptyView()
                                }
                            }
                            
                            
                        
                    
                                
                            VStack(alignment : .leading){
                                Text(latestLaunchDetails.name)
                                    .font(.largeTitle.bold())
                                
                                HStack{

                                
                                
                                Image(systemName : latestLaunchDetails.cores.last!.reused ? "checkmark.circle.fill" : "multiply.circle.fill")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    Text("Reused")
                                        .font(.caption2)
                                    .foregroundColor(.gray)
                                }
                            }
                           
                        }.padding()
                    
                        
                        VStack(alignment : .center){
                            TabBarView()
                        }.padding()
                            
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 36)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 1, x: 1, y: 1))

    }

}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(latestLaunchDetails: .fake)
    }
}
