//
//  RegisterPersonalDataViewController.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/23/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class RegisterPersonalDataViewController: UIViewController,UITextFieldDelegate {
    
    
 //   @IBOutlet weak var defaultTitleContainer: UIView!
  //  @IBOutlet weak var scrollPanel: UIScrollView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    @IBOutlet weak var scrollContent: UIView!
    @IBOutlet weak var scrollContainer: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.userInteractionEnabled = true;
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background-app")!);
        scrollContainer.hidden = true;
        
        // tap for hide keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap);
        
        // get notification before keyboard be shown
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self,
            selector: "keyboardWillBeShown:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        notificationCenter.addObserver(self,
            selector: "keyboardWillBeHidden:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        self.nameTxt.delegate = self;
        self.emailTxt.delegate = self;
        self.confirmPasswordTxt.delegate = self;
        self.passwordTxt.delegate = self;
        
        emailTxt.setBorderBottom();
        nameTxt.setBorderBottom();
        passwordTxt.setBorderBottom();
        confirmPasswordTxt.setBorderBottom();
        
        let vh = UIScreen.mainScreen().bounds.height;
        GTween.set(scrollContainer, params:[y : Int(vh)]);
        scrollContainer.hidden = false;
        GTween.to(scrollContainer, time : 0.5, params : [y : 0, ease : Expo.easeOut]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func keyboardWillBeShown(sender: NSNotification)->Void {
        let info: NSDictionary = sender.userInfo!
        let value: NSValue = info.valueForKey(UIKeyboardFrameBeginUserInfoKey) as! NSValue
        let keyboardSize: Int = Int(value.CGRectValue().size.height);
        GTween.to(self.view, time: 0.5, params:[y : 0 - (keyboardSize/4), ease : Back.easeOut]);
    }
    
    func keyboardWillBeHidden(sender: NSNotification)->Void {
        GTween.to(self.view, time: 0.5, params:[y : 0, ease : Back.easeOut]);
    }
    
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        if(textField == self.nameTxt){
            self.emailTxt.becomeFirstResponder();
        }
        if(textField == self.emailTxt){
            self.passwordTxt.becomeFirstResponder();
        }
        if(textField == self.passwordTxt){
            self.confirmPasswordTxt.becomeFirstResponder();
        }
//        else
//        {
//           // checkForm();
//        }
        
        return false
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard()->Void {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }

}
