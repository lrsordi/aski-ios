//
//  LoginViewController.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/18/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    /************************************************************************************************
    ** OUTLETS
    **************************************************************************************************/
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var formContainer: UIView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var bemailTxt: UIView!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var bpasswordTxt: UIView!
    @IBOutlet weak var enterBtn: UIButton!
    @IBOutlet weak var loadingSpinner: CPLoadingView!
    
    /************************************************************************************************
     ** VARIABLES
     **************************************************************************************************/
    private var containerY:Int!
    
    
    /************************************************************************************************
     ** OVERRIDES
     **************************************************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true;
        
        containerY = Int((UIScreen.mainScreen().bounds.height / 2) - (formContainer.bounds.height / 2));
        
        
        GTween.set(formContainer, params :[y : containerY]);

        
        formContainer.hidden = true;
        self.emailTxt.delegate = self;
        self.passwordTxt.delegate = self;
        loadingSpinner.hidden = true;
        
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
        let vh = UIScreen.mainScreen().bounds.height;
//        let containerY = self.view.convertPoint(formContainer.frame.origin, fromCoordinateSpace: self.view).y;
        
        var posy = Int(vh / 2) - containerY;
        posy = posy - Int(logoImg.bounds.height / 2);
        
        GTween.set(logoImg, params:[y : Int(posy) ]);
        GTween.set(emailTxt, params: [y : Int(emailTxt.frame.origin.y)+30, alpha : 0]);
        GTween.set(passwordTxt, params: [y : Int(passwordTxt.frame.origin.y)+30, alpha : 0]);
        GTween.set(bemailTxt, params: [y : Int(bemailTxt.frame.origin.y)+30, alpha : 0]);
        GTween.set(bpasswordTxt, params: [y : Int(bpasswordTxt.frame.origin.y)+30, alpha : 0]);
        GTween.set(enterBtn, params: [y : Int(enterBtn.frame.origin.y)+30, alpha : 0]);
        
        formContainer.hidden = false;
        GTween.set(formContainer, params :[y : containerY]);
        
        GTween.to(logoImg, time : 1.5, params : [y : 0, ease : Back.easeInOut]);
        GTween.to(emailTxt, time:1, params : [y : Int(emailTxt.frame.origin.y)-30, alpha : 1, ease : Expo.easeInOut, delay:0.3]);
        GTween.to(bemailTxt, time:1, params : [y : Int(bemailTxt.frame.origin.y)-30, alpha : 1, ease : Expo.easeInOut, delay:0.3]);
        
        GTween.to(passwordTxt, time:1, params : [y : Int(passwordTxt.frame.origin.y)-30, alpha : 1, ease : Expo.easeInOut, delay:0.5]);
        GTween.to(bpasswordTxt, time:1, params : [y : Int(bpasswordTxt.frame.origin.y)-30, alpha : 1, ease : Expo.easeInOut, delay:0.5]);
        
        GTween.to(enterBtn, time:1, params : [y : Int(enterBtn.frame.origin.y)-30, alpha : 1, ease : Expo.easeInOut, delay:0.7]);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }
    
    
    
    /************************************************************************************************
     ** PUBLIC METHODS
     **************************************************************************************************/
     
     
     /************************************************************************************************
     ** PRIVATE METHODS
     **************************************************************************************************/
    private func checkForm(){
        sendForm();
        return;
        var errors = false;
        var errorsTxt = "";
        
        if(emailTxt.text?.characters.count < 6){
            errors = true;
            
            errorsTxt += "\n- Usuário deve ter no mínimo 6 caracteres.";
        }
        
        if(passwordTxt.text?.characters.count < 6){
            errors = true;
            errorsTxt += "\n- Senha deve ter no mínimo 6 caracteres.";
        }
        
        
        if(errors){
            Utils.showSimpleAlert(errorsTxt, title: "Os seguintes erros foram encontrados:");
            return;
        }

        
        sendForm();
        
    }
    
    
    private func sendForm()->Void {
        self.view.endEditing(true);
        
        enterBtn.hidden = true;
        
        loadingSpinner.hidden = false;
        //loadingSpinner.strokeColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0);
        loadingSpinner.startLoading();
        
        GTween.set(loadingSpinner, params:[alpha : 0]);
        GTween.to(loadingSpinner, time : 1, params: [alpha : 1]);
        
        
    }
    
    
    
    /************************************************************************************************
     ** EVENTS
     **************************************************************************************************/
    func keyboardWillBeShown(sender: NSNotification)->Void {
        let info: NSDictionary = sender.userInfo!
        let value: NSValue = info.valueForKey(UIKeyboardFrameBeginUserInfoKey) as! NSValue
        let keyboardSize: Int = Int(value.CGRectValue().size.height);
        GTween.to(formContainer, time: 0.5, params:[y : containerY - (keyboardSize/4), ease : Back.easeOut]);
        //scrollView.contentInset = contentInsets
        //scrollView.scrollIndicatorInsets = contentInsets
        
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        /*var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize.height
        let activeTextFieldRect: CGRect? = activeTextField?.frame
        let activeTextFieldOrigin: CGPoint? = activeTextFieldRect?.origin
        if (!CGRectContainsPoint(aRect, activeTextFieldOrigin!)) {
            scrollView.scrollRectToVisible(activeTextFieldRect!, animated:true)
        }*/
    }
    
    func keyboardWillBeHidden(sender: NSNotification)->Void {
        GTween.to(formContainer, time: 0.5, params:[y : containerY, ease : Back.easeOut]);
    }
    
    @IBAction func onTouchUpEnterBtn(sender: AnyObject) {
        checkForm();
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        if(textField == self.emailTxt){
            self.passwordTxt.becomeFirstResponder();
        }
        else
        {
            checkForm();
        }

        return false
    }
    

    //Calls this function when the tap is recognized.
    func dismissKeyboard()->Void {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }


}
