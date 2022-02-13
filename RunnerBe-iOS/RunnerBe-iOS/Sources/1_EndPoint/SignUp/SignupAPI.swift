//
//  SignupAPI.swift
//  RunnerBe-iOS
//
//  Created by 김신우 on 2022/02/13.
//

import Foundation
import Moya

enum SignupAPI {
    case signup(SignupForm)
    case emailDup(email: String)
}

extension SignupAPI: TargetType {
    var baseURL: URL {
        return BaseAPI.url
    }

    var path: String {
        switch self {
        case .signup:
            return "users"
        case let .emailDup(email):
            return "users/email/check/\(email)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signup:
            return .post
        case .emailDup:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .signup(signUpForm):
            var parameters: [String: Any] = [
                "uuid": signUpForm.uuid,
                "nickName": signUpForm.nickName,
                "birthday": signUpForm.birthday,
                "gender": signUpForm.gender.code,
                "job": signUpForm.job.code,
            ]

            if let email = signUpForm.officeEmail {
                parameters["officeEmail"] = email
            }
            if let idCardImageUrl = signUpForm.idCardImageUrl {
                parameters["idCardImageUrl"] = idCardImageUrl
            }

            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default
            )
        case .emailDup:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        nil
    }
}
