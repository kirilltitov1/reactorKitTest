//
//  ViewController.swift
//  test
//
//  Created by Kirill Titov on 22.12.2020.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class PinViewController: UIViewController, View {
    var disposeBag = DisposeBag()
    
    let reactor: PinReactor! = PinReactor()

    @IBOutlet weak var pin1: UILabel!
    @IBOutlet weak var pin2: UILabel!
    @IBOutlet weak var pin3: UILabel!
    @IBOutlet weak var pin4: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var validateMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(reactor: reactor)
    }

    func bind(reactor: PinReactor) {
        self.button1.rx.tap.debug("1️⃣")
            .map { PinReactor.Action.inputPinCode("1") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button2.rx.tap.debug("2️⃣")
            .map { PinReactor.Action.inputPinCode("2") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button3.rx.tap.debug("3️⃣")
            .map { PinReactor.Action.inputPinCode("3") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button4.rx.tap.debug("4️⃣")
            .map { PinReactor.Action.inputPinCode("4") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button5.rx.tap.debug("5️⃣")
            .map { PinReactor.Action.inputPinCode("5") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button6.rx.tap.debug("6️⃣")
            .map { PinReactor.Action.inputPinCode("6") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button7.rx.tap.debug("7️⃣")
            .map { PinReactor.Action.inputPinCode("7") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button8.rx.tap.debug("8️⃣")
            .map { PinReactor.Action.inputPinCode("8") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button9.rx.tap.debug("9️⃣")
            .map { PinReactor.Action.inputPinCode("9") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        self.button0.rx.tap.debug("0️⃣")
            .map { PinReactor.Action.inputPinCode("0") }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        self.reactor.state
            .map { $0.pinCode[0] }
            .bind(to: self.pin1.rx.text)
            .disposed(by: disposeBag)
        self.reactor.state
            .map { $0.pinCode[1] }
            .bind(to: self.pin2.rx.text)
            .disposed(by: disposeBag)
        self.reactor.state
            .map { $0.pinCode[2] }
            .bind(to: self.pin3.rx.text)
            .disposed(by: disposeBag)
        self.reactor.state
            .map { $0.pinCode[3] }
            .bind(to: self.pin4.rx.text)
            .disposed(by: disposeBag)

        
        self.reactor.state
            .map { $0.pinCodeValidate }
            .bind(to: self.validateMsg.rx.text)
            .disposed(by: disposeBag)
    }
}
