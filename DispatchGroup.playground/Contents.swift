import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


class DispatchGroupTest1 {
    private let serialQueue = DispatchQueue(label: "Swift")
    private let groupRed = DispatchGroup()
    func loadInfo() {
        serialQueue.async(group: groupRed) {
            sleep(1)
            print("1")
        }
        
        serialQueue.async(group: groupRed) {
            sleep(1)
            print("2")
        }
        
        groupRed.notify(queue: .main) {
            print("finish all")
        }
        
    }
}

let dispatchGroupTest1 = DispatchGroupTest1()
//dispatchGroupTest1.loadInfo()

class DispatchGroupTest2 {
    private let concurrentQueue = DispatchQueue(label: "Swift", attributes: .concurrent)
    private let groupBlack = DispatchGroup()
    func loadInfo() {
        groupBlack.enter()
        concurrentQueue.async {
            sleep(1)
            print("1")
            self.groupBlack.leave()
        }
        groupBlack.enter()
        concurrentQueue.async {
            sleep(1)
            print("2")
            self.groupBlack.leave()
        }
        
        groupBlack.wait()
        print("finish all")
        
        groupBlack.notify(queue: .main) {
            print("finish all blackGroup")
        }
    }
}

let dispatchGroupTest2 = DispatchGroupTest2()
//dispatchGroupTest2.loadInfo()
