//
//  UIViewControllerExtension.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showProgressIndicator() {
        self.view.isUserInteractionEnabled = false
        let progressIndicator = ProgressIndicator(text: "Please wait..")
        progressIndicator.tag = progressIndicatorTag
        self.view.addSubview(progressIndicator)
        
    }
    
    /* Hide progress Indicator */
    func hideProgressIndicator(){
        self.view.isUserInteractionEnabled = true
        if let viewWithTag = self.view.viewWithTag(progressIndicatorTag) {
            viewWithTag.removeFromSuperview()
        }
        
    }
    
    func showAlertMessage(_ title: String,  message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
