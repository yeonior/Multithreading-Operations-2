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
    @IBOutlet weak var groupCalculationSwitch: UISwitch!
    
    private let queue = OperationQueue()
    private let iterationsArray = [5000, 10000, 30000, 50000]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.layer.cornerRadius = 15
        clearButton.layer.cornerRadius = 15
        groupCalculationSwitch.isOn = false
    }
    
    private func updateUI(view: UIView, operation: ComputePiOperation) {
        
        DispatchQueue.main.async {
            for indexR in operation.redPointsArray {
                view.addSubview(indexR)
            }
            
            for indexB in operation.bluePointsArray {
                view.addSubview(indexB)
            }
        }
    }
    
    @IBAction func calculateButtonAction(_ sender: UIButton) {
        
        for (index, value) in iterationsArray.enumerated() {
            let _value = viewCollection[index]
            
            // creating operation
            let operation = ComputePiOperation(iterations: value)
            operation.completionBlock = {
                print("Operation #\(index)")
                
//                // pi number calculation
//                let pi = Double(operation.redPointsArray.count) / Double(operation.bluePointsArray.count)
//                print("\nPI NUMBER = \(pi)\n")
//                print(operation.redPointsArray.count)
//                print(operation.bluePointsArray.count)
                
                // updating UI
                self.updateUI(view: _value, operation: operation)
            }
            
            queue.addOperation(operation)
            
            // group calculation
            if groupCalculationSwitch.isOn {
                queue.waitUntilAllOperationsAreFinished()
            }
        }
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        
    }
}

