//
//  Task2ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 23.03.2024.
//

import UIKit

class Task2ViewController: UIViewController {
    
    override func viewDidLoad() {
        print("Task 1 is finished")
        
        Task.detached(priority: .userInitiated) {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        }
        
        print("Task 3 is finished")
    }
}

// замена на detached повлияла лишь на потокобезопасность и на то, что задача стала выполняться на главном потоке

