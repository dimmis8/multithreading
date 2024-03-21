//
//  PhrasesServiceActorViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class PhrasesServiceActorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrasesService = PhrasesService()
        
        
            for i in 0..<10 {
                DispatchQueue.global().async {
                    Task {
                        await phrasesService.addPhrase("Phrase \(i)")
                    }
                }
            }
        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)
        
        // Выводим результат
        Task {
            let phrases = await phrasesService.phrases
            print(phrases)
        }
    }
}

actor PhrasesService {
    var phrases: [String] = []
    func addPhrase(_ phrase: String) async {
        phrases.append(phrase)
    }
}

