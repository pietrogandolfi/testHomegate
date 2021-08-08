//
//  PropertyRowViewModel.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 06.08.21.
//

import Foundation

struct PropertyRowViewModel: Identifiable {
    
    // MARK: - Properties
    
    private let item: PropertyItem
    private let storage: StorageProtocol
    
    var id: String {
        return title + "\(price)"
    }
    
    var title: String {
        return item.title
    }
    
    var price: Int {
        guard let price = item.price else { return 0 }
        return price
    }
    
    var address: String {
        return item.street
    }
    
    var imageURL: String {
        return item.pictures.first ?? item.picFilename1
    }
    
    var isFavourite: Bool {
        guard let isFavourite = storage.getProperties().first(where: { $0.id == id })?.isFavourite else { return false }
        
        return isFavourite
    }
    
    // MARK: - Lifecycle
    
    init(item: PropertyItem) {
        self.item = item
        self.storage = StorageManager()
        
    }
    
    // MARK: - Actions
    
    func setFavorite(_ value: Bool) {
        let property = Property(id: self.id, isFavourite: value)
        storage.saveProperty(property)
        print(isFavourite)
    }
    
}
