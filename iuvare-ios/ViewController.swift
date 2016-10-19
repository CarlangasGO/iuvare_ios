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
        
        loadWebView()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            // report for an error
        }
    }
    
    func loadWebView() {
        LoadingIndicatorView.show("Cargando")
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            
            // Do any additional setup after loading the view, typically from a nib.
            let url = URL (string: "http://socios.iuvare.mx")
            let requestObj = URLRequest(url: url!)
            webView.delegate = self
            webView.loadRequest(requestObj)
        } else {
            print("Internet connection FAILED")
            
            let alert = UIAlertController(title: "No hay conexión a internet", message: "Conéctate a una red Wi-Fi o habilita tus datos celulares.", preferredStyle: UIAlertControllerStyle.alert)
            
            let retryAction = UIAlertAction(title: "Volver a intentar", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
                self.loadWebView()
            })
            alert.addAction(retryAction)
            
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    func webViewDidFinishLoad(_ webView : UIWebView) {
        // dismiss the loading indicator view once webView has loaded
        LoadingIndicatorView.hide()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        let alert = UIAlertController(title: "Lo sentimos", message: "Ocurrió un error al cargar el contenido de la app.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Volver a intentar", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
            self.loadWebView()
        }))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
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
