//
//  PrintABCController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 19.03.2024.
//

import UIKit

class PrintABCController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
}

/*
 Сначала будет А, затем C, после B. Так как задачи на главной очереди выполняются последовательно, то есть задача с B
 упала в самый конец очереди и выполниться позже, так как ее задали выполнить асинхронно. Начнет выполняться B,
 закончит С
 */
