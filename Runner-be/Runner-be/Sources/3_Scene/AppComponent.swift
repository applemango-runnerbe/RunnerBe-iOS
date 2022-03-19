//
//  0_AppComponent.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/04.
//

import Foundation
import NeedleFoundation

final class AppComponent: BootstrapComponent {
    var loginService: LoginService {
        return shared { BasicLoginService(
            loginKeyChainService: loginKeyChainService,
            loginAPIService: loginAPIService,
            kakaoLoginService: kakaoLoginService,
            naverLoginService: naverLoginService
        ) }
    }

    var loggedOutComponent: LoggedOutComponent {
        return LoggedOutComponent(parent: self)
    }

    var mainTabComponent: MainTabComponent {
        return MainTabComponent(parent: self)
    }

    var kakaoLoginService: KakaoLoginService {
        return shared { KakaoLoginService() }
    }

    var naverLoginService: NaverLoginService {
        return shared { NaverLoginService() }
    }

    var loginKeyChainService: LoginKeyChainService {
        return shared { BasicLoginKeyChainService() }
    }

    var userKeyChainService: UserKeychainService {
        return shared { BasicUserKeyChainService() }
    }

    var signupKeyChainService: SignupKeyChainService {
        return shared { BasicSignupKeyChainService(userKeyChainService: userKeyChainService) }
    }

    var loginAPIService: LoginAPIService {
        return shared { BasicLoginAPIService() }
    }
}
