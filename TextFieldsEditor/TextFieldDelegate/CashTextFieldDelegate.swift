//
//  CashTextFieldDelegate.swift
//  TextFieldsEditor
//
//  Created by 邱浩庭 on 12/12/2020.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    let toReplace: String = "."
    let replaceWith: String = ""
    let paddingLength = 2
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) {
            return false
        }
        if (string.count == 0) {
            return true
        }

        // pre-processing
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString

        print(newText)
        // convert $00.00 to int
        let cash = strToInt(newText)
        // convert int to $00.00
        textField.text = intToStr(cash)
        
        return false
    }
    
    // Mark: Convert string with $00.00 format to int
    func strToInt(_ inputStr: NSString) -> Int {
        var temp = inputStr
        // get rid of leading $
        if (temp.hasPrefix("$")) {
            temp = temp.substring(from: 1) as NSString
        }
        
        // get rid of "."
        temp = temp.replacingOccurrences(of: toReplace, with: replaceWith) as NSString
        return Int(temp as String) ?? 0
    }
    
    // Mark: Conver int to str with $00.00 format
    func intToStr(_ cash: Int) -> String {
        let strCash = String(cash)
        let insertIdx = strCash.count - paddingLength > 0 ? strCash.count - paddingLength : 0
        var intPart = String(strCash.prefix(insertIdx))
        var decimalPart = String(strCash.suffix(strCash.count - insertIdx))
        decimalPart = padding(decimalPart)
        intPart = padding(intPart)
        
        return "$" + intPart + "." + decimalPart
    }
    
    // Mark: Add 0 padding
    func padding(_ str: String) -> String {
        var result = str
        if (result.count < paddingLength) {
            let temp = result.count
            for _ in 0..<(paddingLength - temp) {
                result = "0" + result
            }
        }
        return result
    }
}
