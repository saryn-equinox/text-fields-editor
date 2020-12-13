//
//  LockableTextFieldDelegate.swift
//  TextFieldsEditor
//
//  Created by 邱浩庭 on 12/12/2020.
//

import Foundation
import UIKit

class LockableTextFieldDelegate: NSObject, UITextFieldDelegate {
    var isLock: Bool?
    
    func toggleLock(_ value: Bool) {
        isLock = value
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let isLock = self.isLock {
            return !isLock
        }
        return true
    }
    
}
