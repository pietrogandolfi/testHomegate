//
//  PropertyListViewModel.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 06.08.21.
//

import Foundation
import Combine

class PropertyListViewModel: ObservableObject {
    @Published var dataSource: [PropertyRowViewModel] = []
    
    private var network: NetworkManager
    private var disposables = Set<AnyCancellable>()
    
    init(scheduler: DispatchQueue = DispatchQueue(label: "PropertyListViewModel")) {
        self.network = NetworkManager()
        
        network.getAllProperties()
            .map { response in
                response.items.map(PropertyRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] props in
                    guard let self = self else { return }
                    self.dataSource = props
                })
            .store(in: &disposables)
        
    }
}

