//
//  Task11ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 23.03.2024.
//

import UIKit

class Task11ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func randomD6() async ->  Int {
            Int.random(in: 1...6)
        }
        Task.init() {
            let result = await randomD6()
            print(result)
        }
        
    }
}
