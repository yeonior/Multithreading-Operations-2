//
//  ViewController.swift
//  Multithreading-Operations2
//
//  Created by ruslan on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewCollection: [UIView]!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var groupCalculation: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        groupCalculation.isOn = false
    }
    
    @IBAction func calculateAction(_ sender: UIButton) {
        
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        
    }
}

