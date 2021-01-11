//
//  PinCoordinator.swift
//  test
//
//  Created by Kirill Titov on 07.01.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class PinCoordinator: BaseCoordinator {
    
    let disposeBag = DisposeBag()
    override func start() {
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        guard let pinViewController = viewController as? PinViewController else { return }
        
        self.navigationController.setNavigationBarHidden(true, animated: false)
        self.navigationController.viewControllers = [pinViewController]
    }
}
