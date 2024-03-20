//
//  ThreadCurrentController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 18.03.2024.
//

import UIKit

class ThreadCurrentController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Thread.current)
    }
}
