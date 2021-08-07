//
//  PropertyError.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 07.08.21.
//

import Foundation

enum PropertyError: Error {
    case parsing(_ description: String)
    case network(_ description: String)
    case storage(_ description: String)
}
