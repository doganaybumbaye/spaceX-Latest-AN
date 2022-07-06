//
//  TabBarView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import SwiftUI

struct TabBarView: View {
    @State var selection = 0
    var body: some View {
        Tabs(tabs: .constant(["Information", "Failures", "Details"]), selection: $selection, underlineColor: .blue) { title, isSelected in
            Text(title)
                
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .padding(.bottom,10)
                .foregroundColor(isSelected ? .black : .gray)
        }
        
        switch selection{
        case 0:
            InformationView(launchInfo : .fake)
            
        case 1 :
            FailuresView(launchFailures : .fake)
        case 2:
            DetailsView(launchDetails : .fake)
        default:
            EmptyView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}



struct Tabs<Label : View> : View{
    @Binding var tabs : [String] // Tab titles
    @Binding var selection: Int // Switching between views...
    let underlineColor: Color
    let label: (String, Bool) -> Label // A label, is that selected or not
    
    var body: some View{
        VStack(){
          HStack(alignment: .center, spacing: 35) {
            ForEach(tabs, id: \.self) {
                
                self.tab(title: $0)
                
            }
          }.padding(.horizontal, 10)
      }
    }
    
    
    
    func tab(title: String) -> some View {
      let index = self.tabs.firstIndex(of: title)!
      let isSelected = index == selection
      return Button(action: {
        //Lets underline which is selected
        withAnimation {
           self.selection = index
        }
      }) {
        label(title, isSelected)
          .overlay(Rectangle()
            .frame(height: 2)
            .foregroundColor(isSelected ? underlineColor : .clear)
            .padding(.top, 2)
            .transition(.move(edge: .bottom)) ,alignment: .bottomLeading)
      }
    }
}
