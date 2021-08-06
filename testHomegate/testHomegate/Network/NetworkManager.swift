//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Moya

protocol NetworkManagerProtocol {
    func getAllProperties(completion: @escaping (([PropertyItem]?, Error?)) -> Void)
}

class NetworkManager: MoyaProvider<HomegateService>, NetworkManagerProtocol {
    
}
