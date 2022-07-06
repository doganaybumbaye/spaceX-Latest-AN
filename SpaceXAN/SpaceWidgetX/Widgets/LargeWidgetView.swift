//
//  LargeWidgetView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 5.07.2022.
//

import SwiftUI

struct LargeWidgetView: View {
    var widgetInfo : LaunchInfo
    var body: some View {
        ZStack{
            
        
        WidgetImageURL(url: URL(string: widgetInfo.links.patch.large)!)
            .aspectRatio(contentMode: .fill)
            
        }
      
            .overlay{
                
                VStack{
                HStack{
                    Text(widgetInfo.name)
                        
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: widgetInfo.success ? Status.Image.successImage.rawValue : Status.Image.failedImage.rawValue)
                        .font(.title)
                        .foregroundColor(widgetInfo.success ? .green : .red)
                        
                    
                }
                    
                    HStack{
                        Image(systemName: "clock")
                        Text(widgetInfo.date_unix.calculateDates())
                            .font(.caption)
                            .bold()
                            
                        Spacer()
                    }.foregroundColor(.white)

                        
                    Spacer()
                }.padding()
                VStack(alignment : .leading){
                    
                    Text("Details")
                        .bold()
                        .font(.caption)
                    DetailsView(launchDetails: widgetInfo)
                    Text("Failures")
                        .bold()
                        .font(.caption)
                    FailuresView(launchFailures: widgetInfo)
                }.foregroundColor(.white)
                    
                
                
                    
                    
                    
            }
        }
            
    
}

struct LargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LargeWidgetView(widgetInfo: .fake)
    }
}
