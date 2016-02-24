//
//  Utils.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/22/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class Utils: NSObject {
    static func showSimpleAlert(message:String, title : String)->Void {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
}


extension UIButton {
    func setImageColorForState(image: UIImage, color: UIColor, forState: UIControlState) {
        let temp = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        setImage(temp, forState: forState)
        tintColor = color
    }
}

extension UITextField {
    func setBorderBottom(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor(red: 136.0/255.0, green: 136.0/255.0, blue: 136.0/255.0, alpha: 1.0).CGColor;
        
        print(self.frame.size.width);
        border.frame = CGRect(x: 0, y: self.frame.size.height - width + 3, width:  self.frame.size.width, height: 1)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = false
    }
}