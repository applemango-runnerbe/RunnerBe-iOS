//
//  SelectPlaceCoordinator.swift
//  Runner-be
//
//  Created by 김창규 on 8/20/24.
//

import Foundation
import RxSwift

enum SelectPlaceResult {
    case cancel
    case apply(String)
}

final class SelectPlaceCoordinator: BasicCoordinator<SelectPlaceResult> {
    var component: SelectPlaceComponent

    init(
        component: SelectPlaceComponent,
        navController: UINavigationController
    ) {
        self.component = component
        super.init(navController: navController)
    }

    override func start(animated: Bool = true) {
        let scene = component.scene
        navigationController.pushViewController(scene.VC, animated: animated)
        closeSignal
            .bind { [weak self] _ in
                self?.navigationController.popViewController(animated: true)
            }.disposed(by: sceneDisposeBag)

        scene.VM.routes.cancel
            .map { SelectPlaceResult.cancel }
            .bind(to: closeSignal)
            .disposed(by: sceneDisposeBag)

        scene.VM.routes.detailSelectPlace
            .subscribe(onNext: { [weak self] completerResult in
                self?.pushDetailSelectPlace(
                    placeInfo: PlaceInfo(
                        title: completerResult.title,
                        subTitle: completerResult.subtitle
                    ),
                    animated: true
                )
            })
            .disposed(by: sceneDisposeBag)
    }

    private func pushDetailSelectPlace(
        placeInfo: PlaceInfo,
        animated: Bool
    ) {
        let comp = component.detailSelectPlaceComponent(placeInfo: placeInfo)
        let coord = DetailSelectPlaceCoordinator(
            component: comp,
            navController: navigationController
        )

        coordinate(
            coordinator: coord,
            animated: animated
        ) { coordResult in
            switch coordResult {
            case let .apply(address):
                print("cancel BBB Address : \(address)")
            case .cancel:
                print("cancel AAA")
            }
        }
    }
}
