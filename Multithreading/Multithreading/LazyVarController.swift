//
//  Print123456Controller.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 20.03.2024.
//

import UIKit

final class LazyVarController: UIViewController {
    private lazy var name = "I love RM"
    private let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.lock.lock()
            print(self.name) // Считываем из Global
            print(Thread.current)
            self.lock.unlock()
        }
        lock.lock()
        print(self.name) // Считываем имя и main
        lock.unlock()
    }
}

/*
 Проблема будет в том, что name будет инициализированно дважды, так как идет одновременное обращение к переменной с
 разных потоков
 */
