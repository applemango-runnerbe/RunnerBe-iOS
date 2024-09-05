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

    func writeLogComponent(logForm: LogForm) -> WriteLogComponent {
        return WriteLogComponent(logForm: logForm)
    }

    func confirmLogComponent(postId: Int) -> ConfirmLogComponent {
        return ConfirmLogComponent(postId: postId)
    }

    func manageAttendanceComponent(postId: Int) -> ManageAttendanceComponent {
        return ManageAttendanceComponent(myRunningIdx: postId)
    }

    func confirmAttendanceComponent(postId: Int) -> ConfirmAttendanceComponent {
        return ConfirmAttendanceComponent(postId: postId)
    }
}
