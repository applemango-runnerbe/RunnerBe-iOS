//
//  0_BasicCoordinator.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/04.
//

import RxSwift
import UIKit

protocol Coordinator: AnyObject {
    var uuid: UUID { get }
    var navController: UINavigationController { get set }
    var childs: [UUID: Coordinator] { get set }
    func release()
}

class BasicCoordinator<ResultType>: Coordinator {
    // MARK: Lifecycle

    init(navController: UINavigationController) {
        self.navController = navController
        navController.setNavigationBarHidden(true, animated: false)
    }

    deinit {
        print("\(Self.self) deinit")
    }

    // MARK: Internal

    typealias CoordinationResult = ResultType

    let uuid = UUID()
    var disposeBag = DisposeBag()

    var navController: UINavigationController

    var childs = [UUID: Coordinator]()
    var closeSignal = PublishSubject<CoordinationResult>()

    @discardableResult
    func coordinate<T>(coordinator: BasicCoordinator<T>) -> Observable<T> {
        childs[coordinator.uuid] = coordinator
        coordinator.start()
        return coordinator.closeSignal
    }

    func release<T>(coordinator: BasicCoordinator<T>) {
        let uuid = coordinator.uuid
        coordinator.release()
        childs.removeValue(forKey: uuid)
    }

    func release() {
        childs.forEach { _, coord in coord.release() }
        childs.removeAll()
    }

    func start() {
        fatalError("start() must be impl")
    }

    // MARK: Private

    private func store<T>(coordinator: BasicCoordinator<T>) {
        childs[coordinator.uuid] = coordinator
    }
}
