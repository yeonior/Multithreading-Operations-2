//
//  ComputePiOperation.swift
//  Multithreading-Operations2
//
//  Created by ruslan on 01.12.2021.
//

import UIKit

final class ComputePiOperation: Operation {
    
    private var _iterations = 0
    private(set) var redPointsArray = [UIView]()
    private(set) var bluePointsArray = [UIView]()
    
    init(iterations: Int) {
        self._iterations = iterations
    }
    
    override func main() {
        
        let startTime = Date()
        
        
        
        print("Calculated in \(Date().timeIntervalSince(startTime)) seconds")
    }
}
