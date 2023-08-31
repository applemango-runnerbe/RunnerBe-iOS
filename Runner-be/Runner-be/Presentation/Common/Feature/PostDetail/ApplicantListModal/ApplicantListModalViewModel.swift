//
//  ApplicantListModalViewModel.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/26.
//

import Foundation
import RxSwift

final class ApplicantListModalViewModel: BaseViewModel {
    var applicants: [User]
    var changed = false
    var postId = 0
    private let postUseCase = PostUseCase()

    init(postId: Int, applicants: [User]) {
        self.applicants = applicants
        self.postId = postId

        super.init()

        uiBusinessLogic()
        requestDataToUseCase()
    }

    struct Input {
        var backward = PublishSubject<Void>()
        var accept = PublishSubject<(idx: Int, accept: Bool)>()
        var finishing = PublishSubject<Void>()
    }

    struct Output {
        var participants = ReplaySubject<[UserConfig]>.create(bufferSize: 1)
    }

    struct Route {
        var backward = PublishSubject<Bool>()
    }

    private var disposeBag = DisposeBag()
    var inputs = Input()
    var outputs = Output()
    var routes = Route()
}

extension ApplicantListModalViewModel {
    func uiBusinessLogic() {
        inputs.backward
            .map { [weak self] in self?.changed ?? true }
            .bind(to: routes.backward)
            .disposed(by: disposeBag)

        Observable<[User]>.of(applicants)
            .map {
                $0.reduce(into: [UserConfig]()) {
                    $0.append(UserConfig(from: $1, owner: false))
                }
            }
            .subscribe(onNext: { [weak self] applicants in
                self?.outputs.participants.onNext(applicants)
            })
            .disposed(by: disposeBag)
    }

    func requestDataToUseCase() {
        inputs.accept
            .flatMap {
                self.postUseCase.accept(postId: self.postId,
                                        applicantId: self.applicants[$0.idx].userID,
                                        accept: $0.accept)
            }
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }

                let message: String?
                switch result {
                case let .response(result: data):
                    if data.success {
                        message = data.accept ? "수락 완료" : "거절 완료"
                        self.applicants.removeAll(where: { $0.userID == data.id })
                        let configs = self.applicants.reduce(into: [UserConfig]()) {
                            $0.append(UserConfig(from: $1, owner: false))
                        }
                        self.outputs.participants.onNext(configs)
                        self.changed = true
                    } else {
                        message = "수락 실패"
                    }
                case let .error(alertMessage: alertMessage):
                    message = alertMessage
                }

                if let message = message {
                    self.toast.onNext(message)
                }
            })
            .disposed(by: disposeBag)

        inputs.finishing
            .flatMap {
                self.postUseCase.close(postId: self.postId)
            }
            .subscribe(onNext: { [weak self] result in
                switch result {
                case let .response(success):
                    if success {
                        self?.toast.onNext("마감 완료")
                        self?.routes.backward.onNext(true)
                    } else {
                        self?.toast.onNext("다시시도해주세요")
                    }
                case let .error(alertMessage):
                    if let alertMessage = alertMessage {
                        self?.toast.onNext(alertMessage)
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
