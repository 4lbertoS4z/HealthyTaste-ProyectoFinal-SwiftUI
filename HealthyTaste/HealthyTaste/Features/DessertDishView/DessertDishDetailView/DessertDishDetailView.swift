

import SwiftUI

struct DessertDishDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: DessertDishDetailViewModel
    
    let dessert: Dessert
    
    init(viewModel: DessertDishDetailViewModel, dessert: Dessert) {
       
        _viewModel = StateObject(wrappedValue: viewModel)
        self.dessert = dessert
    }
    
    var body: some View {
        ScrollView {
            LazyVStack() {
                Text(dessert.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                AsyncImage(url: URL(string: dessert.image)) { state in
                    switch state {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                    case .failure:
                        Text("Error al cargar la imagen")
                    @unknown default:
                        EmptyView()
                    }
                }

                Section(header: Text("Ingredientes").font(.headline)) {
                    ForEach(dessert.details.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                            
                    }
                }

                Section(header: Text("Elaboración").font(.headline)) {
                    Text(dessert.details.elaboration)
                }

                Section(header: Text("Alergias").font(.headline)) {
                    RemoteImage(url: dessert.details.imgAllergies)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                }

                if let videoID = extractYouTubeID(from: dessert.details.urlVideo) {
                    VideoPlayer(ID: videoID)
                } else {
                    Text("Video no disponible")
                }
            }
            .padding()
        }
        .navigationBarTitle("Detalle de la Receta", displayMode: .inline)
        .toolbar{
            Button("Favorite", systemImage: viewModel.isFavorite ? "star.fill" : "star") {
                Task {
                    await toggleFavoriteDessertDish(dessert: dessert)                        }
            }
        }
        .onAppear {
            Task {
                await viewModel.isFavoriteDessertDish(dessert: dessert)
            }
        }
    }
    func extractYouTubeID(from url: String) -> String? {
            // Suponiendo que la URL es algo como "https://www.youtube.com/watch?v=VIDEOID" o "https://youtu.be/VIDEOID"
            if let urlComponents = URLComponents(string: url),
               let queryItems = urlComponents.queryItems {
                // Para URLs del tipo "https://www.youtube.com/watch?v=VIDEOID"
                return queryItems.first(where: { $0.name == "v" })?.value
            } else {
                // Para URLs del tipo "https://youtu.be/VIDEOID"
                return url.components(separatedBy: "/").last
            }
        }
    
    private func toggleFavoriteDessertDish(dessert: Dessert) async {
        if viewModel.isFavorite {
            await viewModel.removeFavoriteDessertDish(dessert: dessert)
        } else {
            await viewModel.addFavoriteDessertDish(dessert:dessert)
        }
    }
    
}


