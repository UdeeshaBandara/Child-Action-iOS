//
//  ChildActionBase.swift
//  Child Action
//
//  Created by Fixel Dev on 8/14/21.
//

import Foundation
import UIKit

class ChildActionBase{
    
    
    
    
}
extension UITextField {
    
    func updateDesign()  {
       
        self.font = UIFont(name: "OpenSans-Regular", size: 16)
        self.textAlignment = .left
        self.layer.borderColor = #colorLiteral(red: 0.5417729616, green: 0.6783421636, blue: 0.4366089106, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 22.5
        self.textColor = #colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1)
        self.autocorrectionType = .yes
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        
    }
    
    
}
extension UILabel{
    
    func updateDonateLabel(text : String){
       
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name:"OpenSans-SemiBold",size:14)
        self.textAlignment = .left
        self.textColor = #colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1)
     
    }
    func updateToHeading(text : String){
       
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name:"OpenSans-Bold",size:28)
        self.textAlignment = .left
        self.textColor = UIColor(named: "primary")
       
    }
    func updateToSubHeading(text : String,isSemiBold : Bool){
       
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = isSemiBold ? UIFont(name:"OpenSans-SemiBold",size:16) : UIFont(name:"OpenSans-Bold",size:16)
        self.textAlignment = .left
        self.textColor = #colorLiteral(red: 0.07841768116, green: 0.07843924314, blue: 0.07841629535, alpha: 1)
        
    }
    func updateToContent(text : String, isClickable : Bool){
       
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name:"OpenSans-Regular",size:16)
        self.textAlignment = .left
        self.textColor = isClickable ? UIColor(named: "primary") : #colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1) 
        self.lineBreakMode = .byWordWrapping 
        self.numberOfLines = 0
       
    }
    
}
extension UIViewController {
    
    
    func hideKeyboard() {
        
        self.view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    func initKeyboardNotification () {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height / 3 + 50
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
       
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
}
