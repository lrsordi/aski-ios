//
//  Backend.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/22/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit
import Alamofire

class Backend: NSObject {
    static let ROOT_URL : String = "http://localhost:8080/api/";
    
    
    static func signin(usernamev : String, passwordv : String, resolve: (Bool)->Void, reject: ()->Void){
        Alamofire.request(.POST, ROOT_URL + "user/signin", parameters: ["username" : usernamev, "password" : passwordv])
            .responseJSON { response in
                if(response.result.isFailure){
                    reject();
                }
                else{
                    var bol = response.result.value!.valueForKey("success")?.boolValue;
                    if(bol == true){
                        Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders = ["Authorization" : response.result.value!.valueForKey("token")!];
                        NSUserDefaults.standardUserDefaults().setValue(response.result.value!.valueForKey("token")!,forKey:"authorization-aski" );
                        NSUserDefaults.standardUserDefaults().synchronize();
                        
                        resolve(true);
                    }
                    else{
                        resolve(false);
                    }
                }
                
                /*if let JSON = response.result.value {
                    
                    print(JSON.success);
                }*/
        }
    }
}
