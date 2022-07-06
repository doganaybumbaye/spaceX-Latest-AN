//
//  VideoPlayerView.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 1.07.2022.
//

import Foundation
import WebKit
import SwiftUI
import UIKit

struct VideoView : UIViewRepresentable{

    let video_id : String
    @Binding var showLoading : Bool

    func makeUIView(context: Context) -> some UIView {
        let launchVideo = URL(string: "https://www.youtube.com/embed/\(video_id)")!
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: launchVideo, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        return webView

    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
    func makeCoordinator() -> VideoViewCoordinator {
        VideoViewCoordinator {
            showLoading = true
        } didFinish: {
            showLoading = false
        }

    }
}

class VideoViewCoordinator : NSObject, WKNavigationDelegate {
    
    var didStart : () -> Void
    var didFinish : () -> Void
    
    init(didStart : @escaping () -> Void = {}, didFinish : @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
}


