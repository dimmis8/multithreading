import UIKit
import PlaygroundSupport


class MyViewController: UIViewController {
    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Vc1"
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initButton()
    }
    
    @objc func pressAction() {
        let vc2 = TwoViewController()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func initButton() {
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.setTitle("Press", for: .normal)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
    }
}

class TwoViewController: UIViewController {
    var imageview = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Vc2"
        initImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func initImage() {
        imageview.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageview.center = view.center
        view.addSubview(imageview)
    }
}

let vc = MyViewController()
let navBar = UINavigationController(rootViewController: vc)

PlaygroundPage.current.liveView = navBar
