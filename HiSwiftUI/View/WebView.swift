//
//  WebView.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/14.
//

//import UIKit
//import SwiftUI
//import WebKit
//import HiBase
//import HiLog
//
//public struct WebView: UIViewRepresentable {
//    
//    let htmlString: String
//    let configuration: WKWebViewConfiguration
//    
//    init(htmlString: String, configuration: WKWebViewConfiguration) {
//        self.htmlString = htmlString
//        self.configuration = configuration
//    }
//    
//    public func makeUIView(context: Context) -> some UIView {
//        let webView = WKWebView(frame: .zero, configuration: self.configuration)
//        webView.navigationDelegate = context.coordinator
//        if htmlString.isNotEmpty {
//            webView.loadHTMLString(htmlString, baseURL: nil)
//        }
//        return webView
//    }
//    
//    public func updateUIView(_ uiView: UIViewType, context: Context) {
//        log("updateUIView")
//    }
//    
//    public func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self)
//    }
//    
//    public class Coordinator: NSObject, WKNavigationDelegate {
//        var parent: WebView
//        
//        init(parent: WebView) {
//            self.parent = parent
//        }
//        
//        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//            log("didStartProvisionalNavigation")
//        }
//        
//        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//            log("didFinish")
//        }
//        
//        public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
//            log("didFail")
//        }
//        
//        public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//            log("webViewWebContentProcessDidTerminate")
//        }
//        
//    }
//    
//}
