//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldsEditor
//
//  Created by 邱浩庭 on 12/12/2020.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField.text!.count + string.count <= 5 && CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))) || string.count == 0
    }
}
