

import SwiftUI

struct DessertDishDetailView: View {
    let dessert: Dessert
    var body: some View {
        VStack {
            ScrollView{
                Text(dessert.name)
                    .font(.title)
                AsyncImage(url: URL(string: dessert.image)) { state in
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
                Text(dessert.details.ingredients.description)
                Text("Elaboración:")
                    .font(.title)
                Text(dessert.details.elaboration)
            }
        }
        .navigationBarTitle("Recipe Detail", displayMode: .inline)
    }
}


