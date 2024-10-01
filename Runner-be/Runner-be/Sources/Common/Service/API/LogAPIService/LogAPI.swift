//
//  LogAPI.swift
//  Runner-be
//
//  Created by 김창규 on 9/4/24.
//

import Foundation
import Moya

enum LogAPI {
    case fetchLog(userId: Int, year: String, month: String, token: LoginToken)
    case fetchStamp(token: LoginToken)
    case create(createLogRequest: LogForm, userId: Int, token: LoginToken)
    case edit(editLogForm: LogForm, userId: Int, token: LoginToken)
    case delete(userId: Int, logId: Int, token: LoginToken)
    case detail(userId: Int, logId: Int, token: LoginToken)
    case partners(userId: Int, gatheringId: Int, token: LoginToken)
}

extension LogAPI: TargetType {
    var baseURL: URL {
        return BaseAPI.url
    }

    var path: String {
        switch self {
        case let .fetchLog(userId, _, _, _):
            return "/runningLogs/\(userId)"
        case .fetchStamp:
            return ""
        case let .create(_, userId, _):
            return "/runningLogs/\(userId)"
        case let .edit(editLogForm, userId, _):
            return "/runningLogs/\(userId)/\(editLogForm.logId ?? 0)"
        case let .delete(userId, logId, _):
            return "/runningLogs/\(userId)/\(logId)"
        case let .detail(userId, logId, _):
            return "/runningLogs/\(userId)/detail/\(logId)"
        case let .partners(userId, gatheringId, _):
            return "/runningLogs/\(userId)/partners/\(gatheringId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchLog:
            return Method.get
        case .fetchStamp:
            return Method.get
        case .create:
            return Method.post
        case .edit:
            return Method.patch
        case .delete:
            return Method.delete
        case .detail:
            return Method.get
        case .partners:
            return Method.get
        }
    }

    var task: Task {
        switch self {
        case let .fetchLog(_, year, month, _):
            let parameters: [String: Any] = [
                "year": year,
                "month": month,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case let .fetchStamp(token: token):
            return .requestPlain
        case let .create(logForm, _, _):
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ko_KR")
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = dateFormatter.string(from: logForm.runningDate)

            let parameters: [String: Any] = [
                "runningDate": formattedDate,
                "gatheringId": logForm.logId ?? "",
                "stampCode": logForm.stampCode ?? "",
                "contents": logForm.contents ?? "",
                "imageUrl": logForm.imageUrl ?? "",
                "weatherDegree": logForm.weatherDegree ?? "",
                "weatherIcon": logForm.weatherIcon ?? "",
                "isOpened": logForm.isOpened,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case let .edit(editLogForm, _, _):
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ko_KR")
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = dateFormatter.string(from: editLogForm.runningDate)

            let parameters: [String: Any] = [
                "runningDate": formattedDate,
                "stampCode": editLogForm.stampCode ?? "",
                "contents": editLogForm.contents ?? "",
                "imageUrl": editLogForm.imageUrl ?? "",
                "weatherDegree": editLogForm.weatherDegree ?? "",
                "weatherIcon": editLogForm.weatherIcon ?? "",
                "isOpened": editLogForm.isOpened,
            ]

            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

        case let .delete(_, _, token):
            return .requestPlain
        case .detail:
            return .requestPlain
        case .partners:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        var header = ["MobileType": "iOS",
                      "AppVersion": AppContext.shared.version]
        switch self {
        case let .fetchLog(_, _, _, token):
            header["x-access-token"] = "\(token.jwt)"
        case let .fetchStamp(token: token):
            header["x-access-token"] = "\(token.jwt)"
        case let .create(_, _, token):
            header["x-access-token"] = "\(token.jwt)"
        case let .edit(_, _, token):
            header["x-access-token"] = "\(token.jwt)"
        case let .delete(_, _, token):
            header["x-access-token"] = "\(token.jwt)"
        case let .detail(_, _, token):
            header["x-access-token"] = "\(token.jwt)"
        case let .partners(_, _, token):
            header["x-access-token"] = "\(token.jwt)"
        }

        return header
    }
}
