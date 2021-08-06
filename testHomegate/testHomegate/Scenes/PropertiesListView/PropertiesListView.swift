//
//  PropertiesListView.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import SwiftUI

struct PropertiesListView: View {
    var interactor: PropertiesListInteractor
    
    init() {
        self.interactor = PropertiesListInteractor()
    }
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                interactor.getProperties()
            })
            .padding()
    }
}

struct PropertiesListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesListView()
    }
}
