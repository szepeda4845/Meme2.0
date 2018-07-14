//
//  TextField.swift
//  MemeMe2.0
//
//  Created by Samuel Zepeda on 7/12/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit

class TextField: NSObject , UITextFieldDelegate {

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length <= 20
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    
    
}
