//
//  MyRunningListComponent.swift
//  Runner-be
//
//  Created by 김창규 on 8/29/24.
//

import Foundation

final class MyRunningListComponent {
    var scene: (VC: MyRunningListViewController, VM: MyRunningListViewModel) {
        let viewModel = self.viewModel
        return (VC: MyRunningListViewController(viewModel: viewModel), VM: viewModel)
    }

    var viewModel = MyRunningListViewModel()
}
