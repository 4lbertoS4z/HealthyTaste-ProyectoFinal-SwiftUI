//
//  DessertDishFavoriteView.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import SwiftUI

struct DessertDishFavoriteView: View {
    @StateObject private var dessertDishViewModel: DessertDishFavoriteViewModel
    @EnvironmentObject var coordinator: Coordinator

    init(dessertDishViewModel: DessertDishFavoriteViewModel) {
        _dessertDishViewModel = StateObject(wrappedValue: dessertDishViewModel)
    }

    var body: some View {
        NavigationStack {
            if !dessertDishViewModel.favoriteDessertDish.isEmpty {
                List(dessertDishViewModel.favoriteDessertDish, id: \.id) { dessertDish in
                    NavigationLink {
                        coordinator.makeDessertDishDetailView(dessert: dessertDish, popHandler: {
                            Task {
                                await dessertDishViewModel.getFavoriteDessertDishes()
                            }
                        })
                    } label: {
                        HStack {
                            RemoteImage(url: dessertDish.image)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 4, y: 10)
                            Spacer()
                            Text(dessertDish.name)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Dessert Dish")
            } else {
                Text("You do not have any favorite items yet!")
            }
        }
        .onAppear {
            Task {
                await dessertDishViewModel.getFavoriteDessertDishes()
            }
        }
        .alert(isPresented: $dessertDishViewModel.showErrorMessage) {
            Alert(title: Text("Error"),
                  message: Text("Se ha producido un error. Por favor, inténtalo de nuevo más tarde."),
                  dismissButton: .cancel())
        }
    }
}


