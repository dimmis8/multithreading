//
//  FlagsController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 19.03.2024.
//

import UIKit

final class FlagsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        
        // Подождем некоторое время а затем отменяем выполнение потока
        sleep(2)
        while infinityThread.isExecuting {
            if infinityThread.counter == 5 {
                infinityThread.cancel()
            }
        }
        print(infinityThread.isExecuting)
        print(infinityThread.isExecuting)
        print(infinityThread.isFinished)
        sleep(1)
        print(infinityThread.isFinished)
    }
}

class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            counter += 1
            print(counter)
            InfinityLoop.sleep(forTimeInterval: 1)
        }
    }
}
