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

//        network.getAllProperties { [unowned self] result in
//
//            guard let response = result.0 else {
//                print("ERROR - EMPTY RESPONSE")
//                return
//            }
//
//            self.dataSource = response.map({ PropertyRowViewModel(item: $0) })
//            self.dataSource
//                .publisher
//                .sink { [weak self] _ in
//                    // TODO: - something
//                }
//                .store(in: &self.disposables)
//        }
        
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
//                        print(value)
                        self.dataSource = []
                    case .finished:
//                        print(value)
                        break
                    }
                },
                receiveValue: { [weak self] props in
                    guard let self = self else { return }
                    self.dataSource = props
//                    print(props)
                })
            .store(in: &disposables)
        
    }
}

