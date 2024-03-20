//
//  Priority1212Controller.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 19.03.2024.
//

import UIKit

final class Priority1212Controller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем и запускаем поток
        let thread1 = ThreadPrintDemon()
        let thread2 = ThreadPrintAngel()
        
        // Меняем приоритеты
        
        thread1.qualityOfService = .userInteractive
        thread2.qualityOfService = .userInteractive
    
        thread1.start()
        thread2.start()
    }
}
