//
//  DetailSelectPlaceComponent.swift
//  Runner-be
//
//  Created by 김창규 on 8/23/24.
//

import UIKit

final class DetailSelectPlaceComponent {
    var scene: (VC: UIViewController, VM: DetailSelectPlaceViewModel) {
        let viewModel = viewModel
        return (DetailSelectPlaceViewController(viewModel: viewModel),
                viewModel)
    }

    private var viewModel: DetailSelectPlaceViewModel {
        return DetailSelectPlaceViewModel(placeInfo: placeInfo)
    }

    private let placeInfo: PlaceInfo

    init(placeInfo: PlaceInfo) {
        self.placeInfo = placeInfo
    }
}
