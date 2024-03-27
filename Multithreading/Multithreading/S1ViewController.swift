//
//  S1ViewController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 25.03.2024.
//

import UIKit

class S1ViewController: UIViewController {
    let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchData(url: URL(fileURLWithPath: ""))
        func updateUI() {
            // обновляет пользовательский интерфейс
        }
    }
}

class NetworkManager {
    func fetchData(url: URL) {
        // запрос к API
    }
}

protocol AnimalProtocol {
    var sound: String { get }
}

class Animal: AnimalProtocol {
    let name: String
    var sound: String

    init(name: String, sound: String) {
        self.name = name
        self.sound = sound
    }

    func makeSound() {
        print(sound)
    }
}

protocol Shape {
    func printSize () -> ()
}

struct Circle: Shape {
    let radius: CGFloat
    
    func printSize() {
        let diameter = radius * 2
        print(CGSize(width: diameter, height: diameter))
    }
}

struct Rectangle: Shape {
    let width: CGFloat
    let height: CGFloat
    
    func printSize() {
        print(CGSize(width: width, height: height))
    }
}

class SizePrinter {
    func printSize(of shape: Shape) {
        shape.printSize()
    }
}

protocol Bird {
    
}

protocol Flyable {
    func fly()
}

class Penguin: Bird {
}

let myBird: Bird = Penguin()


protocol Worker {
    func work()
}

protocol eater {
    func eat()
}

class Robot: Worker {
    func work() {
        // Робот работает
    }
}

protocol Switchable {
    func turnOn()
    func turnOff()
}

class LightBulb: Switchable {
    func turnOn() {
        // включает свет
        lamp.on()
    }
    
    func turnOff() {
        // включает свет
        lamp.off()
    }
}

class Switch {
    let bulb: Switchable
    
    init(bulb: Switchable) {
        self.bulb = bulb
    }
    
    func toggle() {
        bulb.turnOn()
    }
}
