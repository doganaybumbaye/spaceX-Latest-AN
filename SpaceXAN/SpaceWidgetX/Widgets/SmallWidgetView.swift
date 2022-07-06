//
//  SmallWidgetView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 4.07.2022.
//

import SwiftUI

struct SmallWidgetView: View {

    var widgetInfo : LaunchInfo
    
    var body: some View {
        ZStack{
            
        
        WidgetImageURL(url: URL(string: widgetInfo.links.patch.small)!)
            .aspectRatio(contentMode: .fit)
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
                    Spacer()
                    HStack{
                        Image(systemName: "clock")
                        Text(widgetInfo.date_unix.calculateDates())
                            .font(.caption)
                            .bold()
                            
                        Spacer()
                    }.foregroundColor(.white)

                        
                    Spacer()
                }.padding()
                
                
            }
          
        
    }
        
        
    
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(widgetInfo: .fake)
    }
}
