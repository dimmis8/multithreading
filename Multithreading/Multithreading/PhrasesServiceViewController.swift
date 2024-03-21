//
//  PhrasesServiceViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class PhrasesServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrasesService = PhrasesService()
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global(qos: .default).async {
            semaphore.wait()
            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }
            semaphore.signal()
        }
        
        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)
        
        // Выводим результат
        semaphore.wait()
        print(phrasesService.phrases)
        semaphore.signal()
    }
    
    class PhrasesService {
        var phrases: [String] = []
        
        func addPhrase(_ phrase: String) {
            phrases.append(phrase)
        }
    }
}
