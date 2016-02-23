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
