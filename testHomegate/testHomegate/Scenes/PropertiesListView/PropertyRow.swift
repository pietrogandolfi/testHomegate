//
//  PropertyRow.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 06.08.21.
//

import SwiftUI

struct PropertyRow: View {
    private let viewModel: PropertyRowViewModel
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage(named: "homePlaceholder")!
    @State var isFavourite : Bool = false
    
    init(viewModel: PropertyRowViewModel) {
        self.viewModel = viewModel
        imageLoader = ImageLoader(urlString: viewModel.imageURL.replacingOccurrences(of: "uat.", with: ""))
        self.isFavourite = self.viewModel.isFavourite
    }
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10, content: {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onReceive(imageLoader.didChange) { data in
                        self.image = UIImage(data: data) ?? UIImage(named: "homePlaceholder")!
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                
                HStack(alignment: .bottom, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("CHF \(viewModel.price)")
                            .font(.callout)

                        Text("\(viewModel.title)")
                            .font(.headline)

                        Text("\(viewModel.address)")
                            .font(.body)
                    }
                    .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        print("TAPPED")
                        
                        self.isFavourite = !self.isFavourite
                        viewModel.setFavorite(self.isFavourite)
                    }) {
                        Image(systemName: self.isFavourite ? "heart.fill" : "heart")
                    }
                    
                    Spacer()
                }
            })
            .onAppear {
                self.isFavourite = viewModel.isFavourite
            }
            
            
            
        }
        .frame(height: 300, alignment: .center)
    }
}
