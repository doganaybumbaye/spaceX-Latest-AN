//
//  ContentView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 1.07.2022.
//

import SwiftUI


struct LaunchView: View {
    @StateObject var viewModel = LaunchViewModel()
    @State var isActive:Bool = false
    @State var showLoading : Bool = false
    var body: some View {
        
        
            ScrollView(.vertical, showsIndicators: false) {
                
                if self.isActive{
                VStack{
                    VStack{
                        HStack(alignment : .firstTextBaseline){
                            Text("SpaceX Latest")
                                .font(.largeTitle.bold())
                            Spacer()
                        }
              
                            
                        VideoView(video_id: viewModel.result.links.youtube_id, showLoading: $showLoading)
                            .clipShape(RoundedRectangle(cornerRadius: 36))
                            .overlay(showLoading ? LottieView(name: "Loading", loopMode: .loop).toView() : EmptyView().toView())
                    }.frame(height: 300, alignment: .center)
                        .padding()
                        
                        
                    
                    InfoView(latestLaunchDetails: viewModel.result)
                        .padding()
                    
                }
            }else{
                VStack{
                    Spacer()
                    LottieView(name: "LaunchScreen", loopMode: .loop)
                        .frame(width: 500, height: 500)
                        .padding()
                }
                .ignoresSafeArea()
            
                        

            }


            }.onAppear {
                viewModel.fetchAll()
             
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                               
                    withAnimation{
                            self.isActive = true
                                }
                            }
            }
    
        }
    
        
        

        
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}


extension View{
    func toView() -> AnyView{
        AnyView(self)
    }
}
