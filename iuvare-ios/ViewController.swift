//
//  ViewController.swift
//  iuvare-ios
//
//  Created by Ricardo Rosas on 06/09/16.
//  Copyright © 2016 La Codería. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController : UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "http://socios.iuvare.mx")
        let requestObj = URLRequest(url: url!)
        webView.delegate = self
        webView.loadRequest(requestObj)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        if ((self.presentedViewController) != nil) {
            super.dismiss(animated: flag, completion: completion)
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.linkClicked {
            UIApplication.shared.openURL(request.url!)
            return false
        }
        return true
    }
    
}
