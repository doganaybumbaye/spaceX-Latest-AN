//
//  WidgetImageURL.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 5.07.2022.
//

import SwiftUI

struct WidgetImageURL: View {
        let url: URL
        var body: some View {
            if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()

            } else {
                Image(systemName: "photo")
            }
        }
    }


struct WidgetImageURL_Previews: PreviewProvider {
    static var previews: some View {
        WidgetImageURL(url: URL(string: "")!)
    }
}
