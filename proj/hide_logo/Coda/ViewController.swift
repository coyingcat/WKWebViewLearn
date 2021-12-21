//
//  ViewController.swift
//  Coda
//
//  Created by Joyce Echessa on 1/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import WebKit
let MessageHandler = "didGetPosts"
let PostSelected = "postSelected"

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    
    var webView: WKWebView!
    var postsWebView: WKWebView?
    var posts: [Post] = []
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
  
    @IBOutlet weak var recentPostsButton: UIBarButtonItem!
    
    
    required init?(coder: NSCoder) {
        let config = WKWebViewConfiguration()
        if let scriptURL = Bundle.main.path(forResource: "hideSections", ofType: "js"){
            do {
                let scriptContent = try String(contentsOfFile: scriptURL)
                let script = WKUserScript(source: scriptContent, injectionTime: .atDocumentStart, forMainFrameOnly: true)
                config.userContentController.addUserScript(script)
                webView = WKWebView(frame: UIScreen.main.bounds, configuration: config)
            } catch {
                print(error)
            }
            
            
        }
        
        
        
        super.init(coder: coder)
        webView.navigationDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.addSubview(webView)
   
        webView.load(URLRequest(url: URL(string:"http://www.appcoda.com")!))
 
        
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        recentPostsButton.isEnabled = false

        
    }
    
    @IBAction func back(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forward(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
  
 
    


    

}

