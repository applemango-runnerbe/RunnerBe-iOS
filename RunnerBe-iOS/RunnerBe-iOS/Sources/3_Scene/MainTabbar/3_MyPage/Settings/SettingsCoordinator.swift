//
//  SettingsCoordinator.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/27.
//

import Foundation
import RxSwift

enum SettingsResult {
    case backward
}

final class SettingsCoordinator: BasicCoordinator<SettingsResult> {
    var component: SettingsComponent

    init(component: SettingsComponent, navController: UINavigationController) {
        self.component = component
        super.init(navController: navController)
    }

    override func start(animated _: Bool) {
        let scene = component.scene
        navController.pushViewController(scene.VC, animated: true)

        closeSignal
            .subscribe(onNext: { [weak self] _ in
                self?.navController.popViewController(animated: true)
            })
            .disposed(by: disposeBag)

        scene.VM.routes.backward
            .map { SettingsResult.backward }
            .bind(to: closeSignal)
            .disposed(by: disposeBag)

        scene.VM.routes.makers
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.pushMakerScene(vm: vm, animated: true)
            })
            .disposed(by: disposeBag)

        scene.VM.routes.logout
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presentLogoutModal(vm: vm, animated: false)
            })
            .disposed(by: disposeBag)

        scene.VM.routes.privacy
            .map { (vm: scene.VM, type: PolicyType.privacy_deal) }
            .subscribe(onNext: { [weak self] input in
                self?.pushPolicy(vm: input.vm, policyType: input.type, animated: true)
            })
            .disposed(by: disposeBag)

        scene.VM.routes.terms
            .map { (vm: scene.VM, type: PolicyType.service) }
            .subscribe(onNext: { [weak self] input in
                self?.pushPolicy(vm: input.vm, policyType: input.type, animated: true)
            })
            .disposed(by: disposeBag)

        scene.VM.routes.license
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.pushLicenseScene(vm: vm, animated: true)
            })
    }

    private func pushLicenseScene(vm _: SettingsViewModel, animated: Bool) {
        let comp = component.licenseComponent
        let coord = LicenseCoordinator(component: comp, navController: navController)

        let disposable = coordinate(coordinator: coord, animated: animated)
            .subscribe(onNext: { [weak self] coordResult in
                defer { self?.release(coordinator: coord) }
                switch coordResult {
                case .backward:
                    break
                }
            })

        addChildBag(id: coord.id, disposable: disposable)
    }

    private func pushMakerScene(vm _: SettingsViewModel, animated: Bool) {
        let comp = component.makerComponent
        let coord = MakerCoordinator(component: comp, navController: navController)

        let disposable = coordinate(coordinator: coord, animated: animated)
            .subscribe(onNext: { [weak self] coordResult in
                defer { self?.release(coordinator: coord) }
                switch coordResult {
                case .backward:
                    break
                }
            })

        addChildBag(id: coord.id, disposable: disposable)
    }

    private func presentLogoutModal(vm _: SettingsViewModel, animated: Bool) {
        let comp = component.logoutModalComponent
        let coord = LogoutModalCoordinator(component: comp, navController: navController)

        let disposable = coordinate(coordinator: coord, animated: animated)
            .subscribe(onNext: { [weak self] coordResult in
                defer { self?.release(coordinator: coord) }
                switch coordResult {
                case .backward:
                    break
                case .logout:
                    // TODO: Logout
                    break
                }
            })

        addChildBag(id: coord.id, disposable: disposable)
    }

    private func pushPolicy(vm _: SettingsViewModel, policyType: PolicyType, animated: Bool) {
        let comp = component.policyDetailComponent(type: policyType, modal: false)
        let coord = PolicyDetailCoordinator(component: comp, navController: navController)

        let disposable = coordinate(coordinator: coord, animated: animated)
            .subscribe(onNext: { [weak self] _ in
                self?.release(coordinator: coord)
            })
        addChildBag(id: coord.id, disposable: disposable)
    }
}
