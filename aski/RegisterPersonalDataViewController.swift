//
//  RegisterPersonalDataViewController.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/23/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class RegisterPersonalDataViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTitleContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultTitleContainer.backgroundColor = UIColor(patternImage: UIImage(named:"register-title-bg-pattern")!);
        // Do any additional setup after loading the view.
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
