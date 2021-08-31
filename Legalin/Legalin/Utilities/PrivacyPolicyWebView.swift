//
//  PrivacyPolicyWebView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 20/08/21.
//

import SwiftUI
import Foundation
import WebKit

struct PrivacyPolicyWebView: UIViewRepresentable {
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else{
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    func updateUIView(_ uiView: PrivacyPolicyWebView.UIViewType, context: UIViewRepresentableContext<PrivacyPolicyWebView>) {
        
    }
    
}


