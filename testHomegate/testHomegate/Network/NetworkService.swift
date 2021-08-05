//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Moya

enum HomegateService {
    case getAllProperties
}

extension HomegateService: TargetType {
    
    var baseURL: URL {

        guard let urlFromString = URL(string: "http://private-492e5-homegate1.apiary-mock.com") else {
            fatalError("Impossible to create an URL")
        }

        return urlFromString
    }

    var path: String {
        switch self {
        
        case .getAllProperties:
            return "/properties"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String: Any] {
        switch self {

        default:
            return [:]
        }
    }

    var task: Task {
        switch self {

        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var sampleData: Data {
        /// Sample data encoding, always in UTF8.
        return "{}".utf8Encoded
    }
}
