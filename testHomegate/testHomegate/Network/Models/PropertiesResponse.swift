//
//  PropertiesResponse.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation

struct PropertiesResponse: Codable {
    let resultCount: Int
    let start: Int
    let page: Int
    let pageCount: Int
    let itemsPerPage: Int
    let hasNextPage: Bool
    let hasPreviousPage: Bool
    let items: [PropertyItem]
}
