//
//  AppCoordinator.swift
//  test
//
//  Created by Kirill Titov on 07.01.2021.
//

import RxSwift
import UIKit

final class AppCoordinator: BaseCoordinator {

    var window: UIWindow!

    override func start(window: UIWindow) {
        self.window = window

        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()

        let coordinator = PinCoordinator()
        coordinator.navigationController = self.navigationController

        self.start(coordinator: coordinator)
    }
}
