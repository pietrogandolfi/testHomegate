//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Realm
import RealmSwift

class StorageManager {
    private var realm: Realm!

    init() throws {
        do {
            realm = try Realm()
        } catch {
            throw StorageError.noStorage
        }
        
    }
}
