//
//  Task12ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 23.03.2024.
//

import UIKit

class Task12ViewController: UIViewController {

    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        Task {
            print(await fetchMessages())
        }
       
    }
    
    func fetchMessages() async -> [Message] {
        return await withCheckedContinuation { contiuation in
            networkService.fetchMessages { message in
                contiuation.resume(with:Result.success(message))
            }
        }
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }

            completion([])
        }
        .resume()
    }
}
