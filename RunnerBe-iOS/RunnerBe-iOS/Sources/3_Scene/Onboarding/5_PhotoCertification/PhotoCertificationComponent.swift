//
//  PhotoCertificationComponent.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/08.
//

import Foundation
import NeedleFoundation

protocol PhotoCertificationDependency: Dependency {}

final class PhotoCertificationComponent: Component<PhotoCertificationDependency> {
    var photoCertificationViewController: UIViewController {
        return PhotoCertificationViewController(viewModel: photoCertificationViewModel)
    }

    var photoCertificationViewModel: PhotoCertificationViewModel {
        return shared { PhotoCertificationViewModel() }
    }
}
