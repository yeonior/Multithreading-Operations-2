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
        
        // estimating Pi using the Monte Carlo method
        for _ in 0..._iterations {
            
            let (x, y) = (drand48() * 2 - 1, drand48() * 2 - 1)
            let point = UIView(frame: CGRect(x: 3 * (x + 1) * 27, y: 3 * (y + 1) * 27, width: 1, height: 1))
            if x * x + y * y <= 1 {
                point.backgroundColor = UIColor.red
                redPointsArray.append(point)
            } else {
                point.backgroundColor = UIColor.blue
                bluePointsArray.append(point)
            }
        }
        
        print("Calculated in \(Date().timeIntervalSince(startTime)) seconds")
    }
}
