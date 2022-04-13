//
//  EditInfoComponent.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/27.
//

import Foundation
import NeedleFoundation

protocol EditInfoDependency: Dependency {}

final class EditInfoComponent: Component<EditInfoDependency> {
    var scene: (VC: UIViewController, VM: EditInfoViewModel) {
        let viewModel = self.viewModel
        return (EditInfoViewController(viewModel: viewModel), viewModel)
    }

    var viewModel: EditInfoViewModel {
        return EditInfoViewModel(user: user)
    }

    init(parent: Scope, user: User) {
        self.user = user
        super.init(parent: parent)
    }

    var user: User

    var nickNameModalComponent: NickNameChangeModalComponent {
        return NickNameChangeModalComponent(parent: self)
    }

    var takePhotoModalComponent: TakePhotoModalComponent {
        return TakePhotoModalComponent(parent: self)
    }
}
