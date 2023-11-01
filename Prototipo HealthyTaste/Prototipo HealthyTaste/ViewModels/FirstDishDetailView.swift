

import SwiftUI

struct FirstDishDetailView: View {
    let first: First
    
    var body: some View {
        VStack {
            ScrollView{
                Text(first.name)
                    .font(.headline)
                AsyncImage(url: URL(string: first.image)) { state in
                    switch state {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    case .failure:
                        Text("Error al cargar la imagen")
                    @unknown default:
                        EmptyView()
                    }
                }
                Text("Ingredientes:")
                    .font(.title)
                Text(first.details.ingredients.description)
                Text("Elaboración:")
                    .font(.title)
                Text(first.details.elaboration)
                
            }
        }
        .navigationBarTitle("Recipe Detail", displayMode: .inline)
    }
}

