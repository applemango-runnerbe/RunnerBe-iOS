//
//  SettingsViewModel.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/27.
//

import Foundation
import RxSwift

final class SettingsViewModel: BaseViewModel {
    private let userAPIService: UserAPIService

    init(userAPIService: UserAPIService) {
        self.userAPIService = userAPIService
        super.init()

        let settingItems: [[SettingCellConfig]] = SettingCategory.allCases.reduce(into: []) { partialResult, category in
            let items: [SettingCellConfig]
            switch category {
            case .policyCategory:
                items = PolicyCategory.allCases.reduce(into: []) {
                    $0.append(SettingCellConfig(title: $1.title, details: $1.detail))
                }
            case .aboutRunnerbeCategory:
                items = AboutRunnerbeCategory.allCases.reduce(into: []) {
                    $0.append(SettingCellConfig(title: $1.title, details: $1.detail))
                }
            case .accountCategory:
                items = AccountCategory.allCases.reduce(into: []) {
                    $0.append(SettingCellConfig(title: $1.title, details: $1.detail))
                }
            }
            partialResult.append(items)
        }
        outputs.menus.onNext(settingItems)

        inputs.tapCell
            .subscribe(onNext: { [weak self] indexPath in
                switch indexPath.section {
                case 0:
                    switch indexPath.item {
                    case 1:
                        self?.routes.terms.onNext(())
                    case 2:
                        self?.routes.privacy.onNext(())
                    case 3:
                        self?.routes.license.onNext(())
                    default: break
                    }
                case 1:
                    switch indexPath.item {
                    case 0:
                        self?.routes.makers.onNext(())
                    case 1:
                        self?.routes.instagram.onNext(())
                    default: break
                    }
                case 2:
                    switch indexPath.item {
                    case 0:
                        self?.routes.logout.onNext(())
                    case 1:
                        self?.routes.signout.onNext(())
                    default: break
                    }
                default:
                    break
                }
            })
            .disposed(by: disposeBag)

        inputs.backward
            .bind(to: routes.backward)
            .disposed(by: disposeBag)

        routeInputs.signout
            .filter { $0 }
            .flatMap { _ in userAPIService.signout() }
            .subscribe(onNext: { [weak self] success in
                if success {
                    self?.outputs.toast.onNext("회원탈퇴가 완료되었습니다.")
                    self?.routes.logout.onNext(())
                } else {
                    self?.outputs.toast.onNext("죄송합니다 다시 시도해주세요.")
                }
            })
            .disposed(by: disposeBag)
    }

    struct Input {
        var tapCell = PublishSubject<(section: Int, item: Int)>()
        var backward = PublishSubject<Void>()
    }

    struct Output {
        var menus = ReplaySubject<[[SettingCellConfig]]>.create(bufferSize: 1)
        var toast = PublishSubject<String>()
    }

    struct Route {
        var backward = PublishSubject<Void>()
        var terms = PublishSubject<Void>()
        var privacy = PublishSubject<Void>()
        var license = PublishSubject<Void>()
        var makers = PublishSubject<Void>()
        var instagram = PublishSubject<Void>()
        var logout = PublishSubject<Void>()
        var signout = PublishSubject<Void>()
    }

    struct RouteInputs {
        var signout = PublishSubject<Bool>()
    }

    private var disposeBag = DisposeBag()
    var inputs = Input()
    var outputs = Output()
    var routes = Route()
    var routeInputs = RouteInputs()
}
