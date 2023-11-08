

import SwiftUI

struct SecondDishDetailView: View {
    let second: Second
    
    
    var body: some View {
        VStack {
            ScrollView{
                Text(second.name)
                    .font(.title)
                AsyncImage(url: URL(string: second.image)) { state in
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
                Text(second.details.ingredients.description)
                Text("Elaboración:")
                    .font(.title)
                Text(second.details.elaboration)
            }
        }
        .navigationBarTitle("Recipe Detail", displayMode: .inline)
    }
}
