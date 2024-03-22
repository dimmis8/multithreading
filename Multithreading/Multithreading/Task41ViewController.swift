//
//  Task41ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 21.03.2024.
//

import UIKit

class Task41ViewController: UIViewController {
    
    final class Post: Sendable {
        
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(Post)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// ошибка возникла, так как класс класс не потокобезопасен, нужно подписать его на протокол и зафиналить его
