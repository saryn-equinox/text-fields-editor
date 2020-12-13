//
//  ViewController.swift
//  TextFieldsEditor
//
//  Created by 邱浩庭 on 12/12/2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zipcodeText: UITextField!
    @IBOutlet weak var cashText: UITextField!
    @IBOutlet weak var lockableText: UITextField!
    
    let cashTextFieldDelegate = CashTextFieldDelegate()
    let zipcodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let lockableTextFieldDelgate = LockableTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zipcodeText.delegate = zipcodeTextFieldDelegate
        cashText.delegate = cashTextFieldDelegate
        lockableText.delegate = lockableTextFieldDelgate
    }
    
    @IBAction @objc func switchToggled(_ sender: Any) {
        lockableTextFieldDelgate.toggleLock(!(sender as! UISwitch).isOn)
    }
}

