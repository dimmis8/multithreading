//
//  SecondProblemViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class SecondProblemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sharedResource = 0
        let semaphore = DispatchSemaphore(value: 1)
        
        
        DispatchQueue.global(qos: .background).async {
            semaphore.wait()
            for _ in 1...100 {
                sharedResource += 1
            }
            print("comlete1")
            semaphore.signal()
        }
        
        DispatchQueue.global(qos: .background).async {
            semaphore.wait()
            for _ in 1...100 {
                sharedResource += 1
            }
            print("comlete2")
            semaphore.signal()
        }
        
    }
}

//  проблема: Data race
