//
//  FirstDishDetailView.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import SwiftUI

struct FirstDishDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: FirstDishDetailViewModel
    
    let firstDish: First
    let popHandler: (() -> Void)?
    
    init(viewModel: FirstDishDetailViewModel, firstDish: First, popHandler: (() -> Void)? = nil) {
        
        _viewModel = StateObject(wrappedValue: viewModel)
        self.firstDish = firstDish
        self.popHandler = popHandler
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text(firstDish.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                AsyncImage(url: URL(string: firstDish.image)) { state in
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
                    ForEach(firstDish.details.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                            
                    }
                }

                Section(header: Text("Elaboración").font(.headline)) {
                    Text(firstDish.details.elaboration)
                }

                Section(header: Text("Alergias").font(.headline)) {
                    RemoteImage(url: firstDish.details.imgAllergies)
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: 80, height: 80)                   
                }

                if let videoID = extractYouTubeID(from: firstDish.details.urlVideo) {
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
                            await toggleFavoriteFirstDish(first: firstDish)                        }
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.isFavoriteFirstDish(first: firstDish)
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
    
    private func toggleFavoriteFirstDish(first: First) async {
        if viewModel.isFavorite {
            await viewModel.removeFavoriteFirstDish(first: first)
        } else {
            await viewModel.addFavoriteFirstDish(first: first)
        }
    }
    
    }



