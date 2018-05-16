//
//  ViewController.swift
//  Sample
//
//  Created by Meniny on 2018-01-20.
//  Copyright © 2018年 Meniny. All rights reserved.
//

import UIKit
import WebKit
import WKWebViewController

class ViewController: UIViewController {

    let url = URL.init(string: "https://meniny.cn/")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func presentWeb(_ sender: UIButton) {
        let webViewController = WKWebViewController.init()
        webViewController.source = .remote(url)
        webViewController.bypassedSSLHosts = [url.host!]
        webViewController.userAgent = "WKWebViewController/1.0.0"
        webViewController.websiteTitleInNavigationBar = false
        webViewController.navigationItem.title = "Elias's Cave"
        webViewController.leftNavigaionBarItemTypes = [.reload]
        webViewController.toolbarItemTypes = [.back, .forward, .activity]
        
        let navigation = UINavigationController.init(rootViewController: webViewController)
        if #available(iOS 11.0, *) {
            navigation.navigationBar.prefersLargeTitles = true
        }
        
        self.present(navigation, animated: true, completion: nil)
    }
    
    @IBAction func showWeb(_ sender: UIButton) {
        let webViewController = WKWebViewController.init()
        webViewController.source = .remote(url)
        webViewController.headers = ["browser": "in-app browser"]
        webViewController.tintColor = .red
        webViewController.cookies = [
            HTTPCookie(properties:
                [HTTPCookiePropertyKey.originURL: url.absoluteString,
                 HTTPCookiePropertyKey.path: "/",
                 HTTPCookiePropertyKey.name: "author",
                 HTTPCookiePropertyKey.value: "Elias Abel"])!,
            HTTPCookie(properties:
                [HTTPCookiePropertyKey.originURL: url.absoluteString,
                 HTTPCookiePropertyKey.path: "/",
                 HTTPCookiePropertyKey.name: "GitHub",
                 HTTPCookiePropertyKey.value: "Meniny"])!]
        self.show(webViewController, sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

