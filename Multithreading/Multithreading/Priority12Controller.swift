//
//  PriorityController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 19.03.2024.
//

import UIKit

final class PriorityController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем и запускаем поток
        let thread1 = ThreadPrintDemon()
        let thread2 = ThreadPrintAngel()
        
        // Меняем приоритеты
        
        thread1.qualityOfService = .userInteractive
        thread2.qualityOfService = .background
    
        thread1.start()
        thread2.start()
    }
}

class ThreadPrintDemon: Thread {
    override func main() {
        for _ in (0..<100) {
            print(1)
        }
    }
}


class ThreadPrintAngel: Thread {
    override func main() {
        for _ in (0..<100) {
            print(2)
        }
    }
}
