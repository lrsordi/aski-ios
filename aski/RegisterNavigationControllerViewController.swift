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
        
        let logo = UIImage(named: "green-logo")
        let logoImage = UIImageView(frame: CGRect(x:0, y:0, width: 100 * 0.6, height: 62 * 0.6))
        logoImage.image = logo;
        logoImage.contentMode = .ScaleAspectFit;
        
        
        self.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(-10), forBarMetrics: UIBarMetrics.Default);
        self.navigationBar.topItem!.titleView = logoImage;
        self.navigationBar.translucent = true;
        
        let degBg : UIImage = UIImage(named: "header-bg")!;
        
        self.navigationBar.setBackgroundImage(degBg.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch), forBarMetrics: .Default);
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background-app")!);
    
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
        
        
        //self.navigationBar.topItem!.titleView!
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
