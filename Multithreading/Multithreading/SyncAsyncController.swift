//
//  SyncAsyncController.swift
//  Multithreading
//
//  Created by Дмитрий Логвинов on 19.03.2024.
//

import UIKit

final class SyncAsyncController: UIViewController {

    private var name = "Введите имя"
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    private let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }
    
    func updateName() {
        lockQueue.async {
            self.lock.lock()
            self.name = "I love RM" // Перезаписываем имя в другом потоке
            self.lock.unlock()
            print(Thread.current)
            print(self.name)
        }
        self.lock.lock()
        print(self.name)
        self.lock.unlock()
    }
}
/*
Порядок именно такой, потому как мы выполнили код ассинхронно выполнению остлаьного кода, и пока мы перемещались на
строку с печатью имени, мы уже успели его заменить, после чего на другом глобавльном потоке произошла печать
*/

/*
Заменив выполнение в синхронном потоке мы останавливаем мейн поток и выполняем то, что указано для авполнения на другом
 потоке, после выполнения происходит переключение на мейн и печатается уже измененное имя
 */

/*
 Проблема первого выполения выявлена: во время записи имени произошло обращение из мейн потока,
 доступ был заблокирован.
 */
