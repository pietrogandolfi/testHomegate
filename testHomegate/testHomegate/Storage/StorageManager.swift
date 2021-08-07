//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation

class StorageManager: StorageProtocol {
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
}
