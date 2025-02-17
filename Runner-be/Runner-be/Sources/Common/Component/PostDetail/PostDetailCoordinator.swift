//
//  PostDetailCoordinator.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/25.
//

import Foundation
import RxSwift

enum PostDetailResult {
    case backward(id: Int, needUpdate: Bool)
}

final class PostDetailCoordinator: BasicCoordinator<PostDetailResult> {
    var component: PostDetailComponent

    init(component: PostDetailComponent, navController: UINavigationController) {
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
            .map { PostDetailResult.backward(id: $0.id, needUpdate: $0.needUpdate) }
            .bind(to: closeSignal)
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.applicantsModal
            .map { (vm: scene.VM, applicants: $0) }
            .subscribe(onNext: { [weak self] result in
                self?.presentApplicantListModal(vm: result.vm, applicants: result.applicants, animated: true)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.report
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presentReportModal(vm: vm, animated: false)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.moreOption
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presentDetailOptionModal(vm: vm, animated: false)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.deleteConfirm
            .map { scene.VM }
            .subscribe(onNext: { [weak self] vm in
                self?.presetnDeleteConfrimModal(vm: vm, animated: false)
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.message
            .map { (vm: scene.VM, roomID: $0) }
            .subscribe(onNext: { [weak self] result in
                if self?.component.fromMessageRoom == true {
                    self?.closeSignal.onNext(PostDetailResult.backward(id: 0, needUpdate: false))
                } else {
                    self?.presentMessageRoom(vm: result.vm, roomID: result.roomID, animated: true)
                }
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.registerRunningPace
            .subscribe(onNext: { [weak self] _ in
                self?.pushRegisterRunningPaceScene()
            })
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.userPage
            .subscribe(onNext: { [weak self] userId in
                self?.pushUserPageScene(
                    userId: userId,
                    vm: scene.VM,
                    animated: true
                )
            }).disposed(by: sceneDisposeBag)
    }

    private func presentApplicantListModal(vm: PostDetailViewModel, applicants: [User], animated: Bool) {
        let comp = component.applicantListModal(applicants: applicants)
        let coord = ApplicantListModalCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord, animated: animated) { coordResult in
            switch coordResult {
            case let .backward(needUpdate):
                if needUpdate {
                    vm.routeInputs.needUpdate.onNext(())
                }
            case let .userPage(userId):
                vm.routeInputs.userPage.onNext(userId)
            }
        }
    }

    private func presentReportModal(vm: PostDetailViewModel, animated: Bool) {
        let comp = component.reportModalComponent
        let coord = ReportModalCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord, animated: animated) { coordResult in
            switch coordResult {
            case .ok:
                vm.routeInputs.report.onNext(true)
            case .cancel:
                vm.routeInputs.report.onNext(false)
            }
        }
    }

    private func presentDetailOptionModal(vm: PostDetailViewModel, animated: Bool) {
        let comp = component.detailOptionModalComponent
        let coord = DetailOptionModalCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord, animated: animated) { coordResult in
            switch coordResult {
            case .delete:
                vm.routeInputs.deleteOption.onNext(())
            case .cancel:
                vm.routeInputs.report.onNext(false)
            }
        }
    }

    private func presetnDeleteConfrimModal(vm: PostDetailViewModel, animated: Bool) {
        let comp = component.deleteConfirmModalComponent
        let coord = DeleteConfirmModalCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord, animated: animated) { coordResult in
            switch coordResult {
            case .delete:
                vm.routeInputs.delete.onNext(())
            case .cancel:
                vm.routeInputs.report.onNext(false)
            }
        }
    }

    private func presentMessageRoom(vm _: PostDetailViewModel, roomID: Int, animated: Bool) {
        let comp = component.messageRoomComponent(roomID: roomID)
        let coord = MessageRoomCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord, animated: animated)
    }

    func pushRegisterRunningPaceScene() {
        let comp = component.registerRunningPaceComponent
        let coord = RegisterRunningPaceCoordinator(component: comp, navController: navigationController)

        coordinate(coordinator: coord)
    }

    private func pushUserPageScene(
        userId: Int,
        vm _: PostDetailViewModel,
        animated: Bool
    ) {
        let comp = component.userPageComponent(userId: userId)
        let coord = UserPageCoordinator(
            component: comp,
            navController: navigationController
        )

        coordinate(
            coordinator: coord,
            animated: animated
        ) { coordResult in
            switch coordResult {
            case .backward:
                print("UserPage coordResult: Backward")
//                vm.routeInputs.needUpdate.onNext(needUpdate)
            }
        }
    }
}
