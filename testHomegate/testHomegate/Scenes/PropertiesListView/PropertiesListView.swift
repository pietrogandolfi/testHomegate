//
//  PropertiesListView.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import SwiftUI

struct PropertiesListView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        let networkManager = NetworkManager()
        
        let prop = networkManager.getAllProperties()
    }
}

struct PropertiesListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertiesListView()
    }
}
