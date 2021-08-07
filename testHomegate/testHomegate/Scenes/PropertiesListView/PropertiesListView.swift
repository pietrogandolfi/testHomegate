//
//  PropertiesListView.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import SwiftUI

struct PropertiesListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: PropertyListViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: PropertyListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    titleSection
                }
            }
            .listStyle(InsetListStyle())
            .navigationBarTitle("Property List")
        }
        .onAppear(perform: {
            
        })
    }
}

private extension PropertiesListView {
    
    var titleSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: PropertyRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}

//struct PropertiesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PropertiesListView(viewModel: $viewModel)
//    }
//}
