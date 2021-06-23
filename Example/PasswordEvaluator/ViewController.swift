//
//  ViewController.swift
//  PasswordEvaluator
//
//  Created by khedheri on 06/23/2021.
//  Copyright (c) 2021 khedheri. All rights reserved.
//

import UIKit
import PasswordEvaluator

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var containerView: PasswordEvaluator!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func textFieldWasChangedHandler(_ sender: Any) {
        let password = textField.text ?? ""
        containerView.updatePasswordEvaluatorView(password: password)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

