//
//  Task13ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 25.03.2024.
//

import UIKit

class Task13ViewController: UIViewController {

    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        Task {
            print( try! await fetchMessages())
        }
       
    }
    
    func fetchMessages() async throws -> [Message] {
        return try await withCheckedThrowingContinuation() { contiuation in
            networkService.fetchMessages { message in
                if message.isEmpty {
                    contiuation.resume(throwing: Error.self as! Error)
                } else {
                    contiuation.resume(with:Result.success(message))
                }
            }
        }
    }
}
