//
//  Task42ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get set }
    // Начата ли операция
    var isExecuting: Bool { get set }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass
    
    var completionBlock: (() -> Void)?
    
    var isFinished: Bool
    
    var isExecuting: Bool
    
    func start() {
        print("operation start")
        completionBlock!()
    }
    
    init(priority: DispatchQoS.QoSClass = .default, completionBlock: ( () -> Void)? = nil) {
        self.priority = priority
        self.completionBlock = completionBlock
        self.isFinished = false
        self.isExecuting = false
    }
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
 
}

class Task42ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
               
                let operationFirst = RMOperation()
                let operationSecond = RMOperation()
                
               
                operationFirst.priority = .userInitiated
                operationFirst.completionBlock = {
                    
                    for _ in 0..<50 {
                        print(2)
                    }
                    print(Thread.current)
                    print("Операция полностью завершена!")
                }
               
                operationFirst.start()
                

                
                operationSecond.priority = .background
                operationSecond.completionBlock = {
                  
                    for _ in 0..<50 {
                        print(1)
                    }
                    print(Thread.current)
                    print("Операция полностью завершена!")
                }
                operationSecond.start()

    }
}
