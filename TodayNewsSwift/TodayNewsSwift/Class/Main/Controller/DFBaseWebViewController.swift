//
//  DFBaseWebViewController.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/7.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit
import WebKit

class DFBaseWebViewController: DFBaseViewController {

    public var url : String?
    
    var webView : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createWebView()
        
        self.loadRequest()
    }

    func createWebView() {
        let configuretion = WKWebViewConfiguration()
        // Webview的偏好设置
        configuretion.preferences = WKPreferences()
        configuretion.preferences.minimumFontSize = 10
        configuretion.preferences.javaScriptEnabled = true
        // 默认是不能通过JS自动打开窗口的，必须通过用户交互才能打开
        configuretion.preferences.javaScriptCanOpenWindowsAutomatically = false
        
        
        let userVc = WKUserContentController()
//        userVc.add(self, name: "jsCalliOS")
        userVc.add(self, name: "jsCalliOS")
        configuretion.userContentController = userVc
        
        let height = self.view.bounds.size.height
        let width = self.view.bounds.size.width
        
        let frame = CGRect(x: 0, y: 64, width: width, height: height - 64.0)
        webView = WKWebView.init(frame: frame, configuration: configuretion)
        webView?.backgroundColor = UIColor.yellow
        webView?.navigationDelegate = self
        webView?.allowsBackForwardNavigationGestures = true
        self.view.addSubview(webView!)
    }
    
    func loadRequest() {
//        let urlString = "https://m.wozaijia.com/designer/"
        if let url = self.url {
            let url = NSURL(string: url)
            
            let request = NSURLRequest(url: url! as URL)
            self.webView?.load(request as URLRequest)
        }
    }
}

extension DFBaseWebViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载成功")
        self.title = webView.title
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("decidePolicyFor navigationResponse")
//        if decisionHandler {
            decisionHandler(WKNavigationResponsePolicy.allow)
//        }
    }
}

extension DFBaseWebViewController : WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message.body %@", message.body)
    }
}
