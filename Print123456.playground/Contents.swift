import UIKit
//import PlaygroundSupport

final class Print123456Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.async {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

let vc = Print123456Controller()
print(1)
let view = vc.view
print(7)

/*
 Предполагаю, что будет 1 2 5 3 4 6 7
 */
/*
 На 5 произошел вызовфункции синхронно в мейн потоке, поймали deadlock.
 viewDidLoad вызавлся из-за того, что мы обратились ко view, чтобы с ним работать, нужно сперва загрузить его в память
 */
