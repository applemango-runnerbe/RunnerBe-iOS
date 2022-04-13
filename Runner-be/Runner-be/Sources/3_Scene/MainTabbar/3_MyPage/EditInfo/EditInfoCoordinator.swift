//
//  EditInfoCoordinator.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/27.
//

import Foundation
import RxSwift

enum EditInfoResult {
    case backward(needUpdate: Bool)
}

final class EditInfoCoordinator: BasicCoordinator<EditInfoResult> {
    var component: EditInfoComponent

    init(component: EditInfoComponent, navController: UINavigationController) {
        self.component = component
        super.init(navController: navController)
    }

    override func start(animated _: Bool) {
        let scene = component.scene
        navigationController.pushViewController(scene.VC, animated: true)

        closeSignal
            .subscribe(onNext: { [weak self] _ in
                self?.navigationController.popViewController(animated: true)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.backward
            .map { EditInfoResult.backward(needUpdate: $0) }
            .bind(to: closeSignal)
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.nickNameModal
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presentNickNameModal(vm: vm, animated: false)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.photoModal
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presentPhotoModal(vm: vm, animated: false)
            })
            .disposed(by: sceneDisposeBag)
    }

    private func presentNickNameModal(vm: EditInfoViewModel, animated: Bool) {
        let comp = component.nickNameModalComponent
        let coord = NickNameChangeModalCoordinator(component: comp, navController: navigationController)
        let uuid = coord.identifier

        let disposable = coordinate(coordinator: coord, animated: animated)
            .take(1)
            .subscribe(onNext: { [weak self] coordResult in
                defer { self?.releaseChild(coordinator: coord) }
                switch coordResult {
                case .ok:
                    vm.routeInputs.changeNickName.onNext(true)
                case .cancel:
                    vm.routeInputs.changeNickName.onNext(false)
                }
            })

        addChildDisposable(id: uuid, disposable: disposable)
    }

    private func presentPhotoModal(vm: EditInfoViewModel, animated: Bool) {
        let comp = component.takePhotoModalComponent
        let coord = TakePhotoModalCoordinator(component: comp, navController: navigationController)
        let uuid = coord.identifier

        let disposable = coordinate(coordinator: coord, animated: animated)
            .take(1)
            .subscribe(onNext: { [weak self] coordResult in
                defer { self?.releaseChild(coordinator: coord) }
                switch coordResult {
                case .takePhoto:
                    vm.routeInputs.photoTypeSelected.onNext(.camera)
                case .choosePhoto:
                    vm.routeInputs.photoTypeSelected.onNext(.library)
                case .cancel:
                    break
                }
            })

        addChildDisposable(id: uuid, disposable: disposable)
    }
}
