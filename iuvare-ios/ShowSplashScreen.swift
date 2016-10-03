//
//  ShowSplashScreen.swift
//  iuvare-ios
//
//  Created by Ricardo Rosas on 12/09/16.
//  Copyright © 2016 La Codería. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perform(#selector(ShowSplashScreen.showWebView), with: nil, afterDelay: 1)
    }
    
    func showWebView() {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
