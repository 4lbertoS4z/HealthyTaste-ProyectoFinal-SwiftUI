//
//  SecondDishFavoriteView.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import SwiftUI

struct SecondDishFavoriteView: View {
    @StateObject private var secondDishViewModel: SecondDishFavoriteViewModel
    @EnvironmentObject var coordinator: Coordinator

    init(secondDishViewModel: SecondDishFavoriteViewModel) {
        _secondDishViewModel = StateObject(wrappedValue: secondDishViewModel)
    }

    var body: some View {
        NavigationStack {
            if !secondDishViewModel.favoriteSecondDish.isEmpty {
                List(secondDishViewModel.favoriteSecondDish, id: \.id) { secondDish in
                    NavigationLink {
                        coordinator.makeSecondDishDetailView(second: secondDish, popHandler: {
                            Task {
                                await secondDishViewModel.getFavoriteSecondDishes()
                            }
                        })
                    } label: {
                        HStack {
                            RemoteImage(url: secondDish.image)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 2, x: 4, y: 10)
                            Spacer()
                            Text(secondDish.name)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Second Dish")
            } else {
                Text("You do not have any favorite items yet!")
            }
        }
        .onAppear {
            Task {
                await secondDishViewModel.getFavoriteSecondDishes()
            }
        }
        .alert(isPresented: $secondDishViewModel.showErrorMessage) {
            Alert(title: Text("Error"),
                  message: Text("Se ha producido un error. Por favor, inténtalo de nuevo más tarde."),
                  dismissButton: .cancel())
        }
    }
}




