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
        
        // estimating pi using the monte carlo method
        for _ in 0..._iterations {
            
            let (x, y) = (drand48() * 2 - 1, drand48() * 2 - 1)
            let point = UIView(frame: CGRect(x: 4 * (x + 1) * 22, y: 4 * (y + 1) * 22, width: 1, height: 1))
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
