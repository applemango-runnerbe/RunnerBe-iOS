//
//  2__LoggedOutCoordinator.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/04.
//

import Foundation
import RxSwift

enum LoggedOutResult {}

final class LoggedOutCoordinator: BasicCoordinator<LoggedOutResult> {
    // MARK: Lifecycle

    init(component: LoggedOutComponent, navController: UINavigationController) {
        self.component = component
        super.init(navController: navController)
    }

    // MARK: Internal

    var component: LoggedOutComponent
    var disposeBag = DisposeBag()

    override func start() {
        navController.pushViewController(component.loggedOutViewController, animated: false)

        component.loggedOutViewModel.route.loginSuccess
            .subscribe(onNext: {
                self.showNickNamePage()
            })
            .disposed(by: disposeBag)
    }

    // MARK: Private

    private func showNickNamePage() {
        let nickNameComp = component.nickNameComponent
        let coordinator = NickNameCoordinator(component: nickNameComp, navController: navController)
        coordinate(coordinator: coordinator)
    }
}
