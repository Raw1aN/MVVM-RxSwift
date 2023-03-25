//
//  ICoordinator.swift
//  RxSwiftTest
//
//  Created by Алексей Щукин on 14.03.2023.
//

import Foundation

typealias CoordinatorHandler = () -> ()

protocol ICoordinator{
    var childrenCoordinators: [ICoordinator] {get set}
    func start()
    var completionHandler: CoordinatorHandler? {get set}
}
