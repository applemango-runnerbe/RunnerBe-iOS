//
//  UserAPIService.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/28.
//

import Foundation
import RxSwift

enum SetNickNameResult {
    case succeed(name: String)
    case duplicated
    case alreadyChanged
    case error
}

enum SetJobResult {
    case succeed
    case error
}

enum SetProfileResult {
    case succeed(data: Data?)
    case error
}

enum UserPageAPIResult {
    case success(userInfo: User, userRunningLog: [MyRunningLog], userRunning: [Post])
}

protocol UserAPIService {
    func setNickName(to name: String) -> Observable<SetNickNameResult>
    func setJob(to job: Job) -> Observable<Bool>
    func setProfileImage(to image: Data?) -> Observable<SetProfileResult>
    func signout() -> Observable<Bool>
    func fetchAlarms() -> Observable<[Alarm]?>
    func checkAlarms() -> Observable<Bool>
    func patchPushAlaram(userId: String, pushOn: String) -> Observable<Bool>
    func patchRunningPace(pace: String) -> Observable<Bool>
    func userPage(userId: Int) -> Observable<APIResult<UserPageAPIResult>>
}
