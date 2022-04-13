//
//  0_AppComponent.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/04.
//

import Foundation
import NeedleFoundation

final class AppComponent: BootstrapComponent {
    var loggedOutComponent: LoggedOutComponent {
        return LoggedOutComponent(parent: self)
    }

    var mainTabComponent: MainTabComponent {
        return MainTabComponent(parent: self)
    }
}
