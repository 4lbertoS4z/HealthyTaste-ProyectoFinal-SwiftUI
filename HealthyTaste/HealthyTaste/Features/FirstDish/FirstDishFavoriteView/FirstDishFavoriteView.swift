//
//  FirstDishFavoriteView.swift
//  HealthyTaste
//
//  Created by alberto saz on 17/11/23.
//

import SwiftUI

struct FirstDishFavoriteView: View {
    @StateObject private var firstDishViewModel: FirstDishFavoriteViewModel
    @EnvironmentObject var coordinator: Coordinator

    init(firstDishViewModel: FirstDishFavoriteViewModel) {
        _firstDishViewModel = StateObject(wrappedValue: firstDishViewModel)
    }

    var body: some View {
        NavigationStack {
            if !firstDishViewModel.favoriteFirstDishs.isEmpty {
                List(firstDishViewModel.favoriteFirstDishs, id: \.id) { firstDish in
                    NavigationLink {
                        coordinator.makeFirstDishDetailView(first: firstDish, popHandler: {
                            Task {
                                await firstDishViewModel.getFavoriteFirstDishes()
                            }
                        })
                    } label: {
                        HStack {
                            RemoteImage(url: firstDish.image)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 4, y: 10)
                            Spacer()
                            Text(firstDish.name)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("First Dish")
            } else {
                Text("You do not have any favorite items yet!")
            }
        }
        .onAppear {
            Task {
                await firstDishViewModel.getFavoriteFirstDishes()
            }
        }
        .alert(isPresented: $firstDishViewModel.showErrorMessage) {
            Alert(title: Text("Error"),
                  message: Text("Se ha producido un error. Por favor, inténtalo de nuevo más tarde."),
                  dismissButton: .cancel())
        }
    }
}




