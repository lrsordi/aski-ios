//
//  RegisterNavigationControllerViewController.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/23/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class RegisterNavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        self.navigationBar.frame = (CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 80));
        
        for parent in self.navigationBar.subviews {
            for childView in parent.subviews {
                if(childView is UIImageView) {
                    childView.removeFromSuperview()
                }
            }
        }
        
        let logo = UIImage(named: "white-logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .ScaleAspectFit;
        self.navigationBar.topItem!.titleView = imageView
        

        
        
        GTween.set(self.navigationBar.topItem!.titleView!, params:[scaleX:0.6,scaleY:0.6,y:-40]);
        GTween.set(self.navigationBar, params:[y:-80]);
        GTween.to(self.navigationBar, time:1, params:[y:0, ease : Expo.easeInOut]);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
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
