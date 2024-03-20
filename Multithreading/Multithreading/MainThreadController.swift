//
//  MainThreadController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 18.03.2024.
//

import UIKit

class MainThreadController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.detachNewThread {
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
}

/*
 Вывод в консоли изменился, так как первый цикл стал выполняться не на главном потоке, параллельно второму циклу.
 В этом и есть прелесть многопоточности
 */
