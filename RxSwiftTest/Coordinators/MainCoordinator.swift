//
//  MainCoordinator.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 14.03.2023.
//

import Foundation
import UIKit

class MainCoordinator: ICoordinator{
    
    let modulefactory = ModuleFactory()
    
    var childrenCoordinators: [ICoordinator]
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childrenCoordinators = []
    }
    
    func start() {
        showMainViewController()
    }
    
    var completionHandler: CoordinatorHandler?
    
    func showMainViewController(){
        let viewController = modulefactory.makeMainViewController()
        //navigationController.
        navigationController.pushViewController(viewController, animated: true)
    }
}
