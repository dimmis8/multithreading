//
//  SemaphoreViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class SemaphoreViewController: UIViewController {
    
    let queue = DispatchQueue(label: "Swift", qos: .default, attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 2)
    let semaphoreTest = SemaphoreTest()

    override func viewDidLoad() {
        super.viewDidLoad()
        queue.async {
            self.semaphore.wait() // -1
            sleep(1)
            print("method1")
            self.semaphore.signal() // +1
        }
        queue.async {
            self.semaphore.wait() // -1
            sleep(1)
            print("method2")
            self.semaphore.signal() // +1
        }
        queue.async {
            self.semaphore.wait() // -1
            sleep(1)
            print("method3")
            self.semaphore.signal() // +1
        }
        semaphoreTest.startAllThread()
//        DispatchQueue.concurrentPerform(iterations: 10) { id in
//            semaphore.wait(timeout: DispatchTime.distantFuture)
//            print("Block", String(id))
//            semaphore.signal()
//        }
        
    }
}

class SemaphoreTest {
    private let semaphore = DispatchSemaphore(value: 2)
    var array: [Int] = []
    
    func methodWork(_ id: Int) {
//        semaphore.wait()
//        array.append(id)
//        print("test array", array.count)
//        
//        Thread.sleep(forTimeInterval: 1)
//        semaphore.signal()
    }
    
    func startAllThread() {
        DispatchQueue.global(qos: .default).async {
            self.methodWork(111)
            print(Thread.current)
        }
        DispatchQueue.global(qos: .default).async {
            self.methodWork(122211)
            print(Thread.current)
        }
        DispatchQueue.global(qos: .default).async {
            self.methodWork(113331)
            print(Thread.current)
        }
        DispatchQueue.global(qos: .default).async {
            self.methodWork(115551)
            print(Thread.current)
        }
    }
}
