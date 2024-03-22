import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class DispatchWorkItem1 {
    private let queue = DispatchQueue(label: "DispatchWorkItem1", attributes: .concurrent)
    func create() {
        let workItem = DispatchWorkItem {
            print(Thread.current)
            print("Start task")
        }
        workItem.notify(queue: .main) {
            print(Thread.current)
            print("Task finish")
        }
        
        queue.async(execute: workItem)
    }
}
//
//let dispatchWorkItem1 = DispatchWorkItem1()
//dispatchWorkItem1.create()

class DispatchWorkItem2 {
    private let queue = DispatchQueue(label: "DispatchWorkItem1")
    func create() {
        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task 1")
        }
        
        queue.async {
            sleep(1)
            print(Thread.current)
            print("Task 2")
        }
        
        let workItem = DispatchWorkItem() {
            print(Thread.current)
            print("start work item task")
        }
        
        queue.async(execute: workItem)
        workItem.cancel()
    }
}

let dispatchWorkItem2 = DispatchWorkItem2()
//dispatchWorkItem2.create()


let imageURL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!

var view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: 800))
var eiffelImage = UIImageView(frame:  CGRect(x: 0, y: 0, width: 800, height: 800))

eiffelImage.backgroundColor = UIColor.yellow
eiffelImage.contentMode = .scaleAspectFit
view.addSubview(eiffelImage)

PlaygroundPage.current.liveView = view

// #classic
func fetchImage() {
    let queue = DispatchQueue.global(qos: .utility)
    
    queue.async {
        if let data = try? Data(contentsOf: imageURL) {
            DispatchQueue.main.async {
                eiffelImage.image = UIImage(data: data)
            }
        }
    }
}
//fetchImage()

// #DispatchWorkItem
func fetchImage2() {
    var data: Data?
    let gueue = DispatchQueue.global(qos: .utility)
    let workItem = DispatchWorkItem(qos: .userInteractive) {
        data = try? Data(contentsOf: imageURL)
        print(Thread.current)
    }
    gueue.async(execute: workItem)
    workItem.notify(queue: .main) {
        if let imageData = data {
            eiffelImage.image = UIImage(data: imageData)
        }
    }
}

fetchImage2()
