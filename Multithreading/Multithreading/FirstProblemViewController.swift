//
//  FirstProblemViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class FirstProblemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let serialQueue = DispatchQueue(label: "com.example.myQueue", attributes: .concurrent)

         serialQueue.async {
            serialQueue.sync {
                print("This will never be printed.")
            }
         }
    }
}
// проблема дедлока
