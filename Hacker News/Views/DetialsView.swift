//
//  DetialsView.swift
//  Hacker News
//
//  Created by Amna on 11/20/20.
//  Copyright © 2020 Amna. All rights reserved.
//

import SwiftUI
import WebKit
struct DetialsView: View {
    let url : String?
    var body: some View {
    WebView(urlString: url )
    }
}

struct DetialsView_Previews: PreviewProvider {
    static var previews: some View {
        DetialsView(url : "https://www.google.com")
    }
}
struct WebView : UIViewRepresentable{
    typealias UIViewType = WKWebView
    
    let urlString : String?
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    func updateUIView(_ uiView: WebView.UIViewType, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let req = URLRequest(url: url)
                uiView.load(req)
            }
        }
    }
    
}
