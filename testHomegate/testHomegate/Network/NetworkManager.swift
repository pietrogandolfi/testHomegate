//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Moya

protocol NetworkManagerProtocol {
    
}

class NetworkManager: MoyaProvider<NetworkService>, NetworkManagerProtocol {
    
}
