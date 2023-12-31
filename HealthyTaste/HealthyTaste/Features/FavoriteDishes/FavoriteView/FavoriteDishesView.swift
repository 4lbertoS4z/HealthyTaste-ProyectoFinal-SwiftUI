//
//  FirstDishFavoriteView.swift
//  HealthyTaste
//
//  Created by alberto saz on 17/11/23.
//

import SwiftUI

struct FavoriteDishesView: View {
    @StateObject private var firstDishViewModel: FirstDishFavoriteViewModel
    @StateObject private var secondDishViewModel: SecondDishFavoriteViewModel
    @StateObject private var dessertDishViewModel: DessertDishFavoriteViewModel
    @EnvironmentObject var coordinator: Coordinator
    @State private var selectedCategory = 0
    
    init(firstDishViewModel: FirstDishFavoriteViewModel, secondDishViewModel: SecondDishFavoriteViewModel, dessertDishViewModel: DessertDishFavoriteViewModel) {
        _firstDishViewModel = StateObject(wrappedValue: firstDishViewModel)
        _secondDishViewModel = StateObject(wrappedValue: secondDishViewModel)
        _dessertDishViewModel = StateObject(wrappedValue: dessertDishViewModel)
    }
    
    var body: some View {
        NavigationStack{
            
            
            VStack {
                Picker(selection: $selectedCategory, label: Text("Select a Category")) {
                    Text("First Dish").tag(0)
                    Text("Second Dish").tag(1)
                    Text("Desserts").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedCategory == 0 {
                    if !firstDishViewModel.favoriteFirstDishs.isEmpty {
                        List(firstDishViewModel.favoriteFirstDishs, id: \.id) { firstDish in
                            NavigationLink {
                                coordinator.makeFirstDishDetailView(first: firstDish)
                                    .onDisappear {
                                        Task {
                                            await firstDishViewModel.getFavoriteFirstDishes()
                                        }
                                    }
                            } label: {
                                FirstDishRowView(first: firstDish)
                            }
                        }
                    } else {
                        Text("You do not have any favorite items yet!")
                    }
                }
                else if selectedCategory == 1 {
                    if !secondDishViewModel.favoriteSecondDish.isEmpty {
                        List(secondDishViewModel.favoriteSecondDish, id: \.id) { secondDish in
                            NavigationLink {
                                coordinator.makeSecondDishDetailView(second: secondDish)
                                    .onDisappear {
                                        Task {
                                            await secondDishViewModel.getFavoriteSecondDishes()
                                        }
                                    }
                            } label: {
                                SecondDishRowView(second: secondDish)
                            }
                        }
                    } else {
                        Text("You do not have any favorite items yet!")
                    }
                } else if selectedCategory == 2 {
                    if !dessertDishViewModel.favoriteDessertDish.isEmpty {
                        List(dessertDishViewModel.favoriteDessertDish, id: \.id) { dessertDish in
                            NavigationLink {
                                coordinator.makeDessertDishDetailView(dessert: dessertDish)
                                    .onDisappear {
                                        Task {
                                            await dessertDishViewModel.getFavoriteDessertDishes()
                                        }
                                    }
                            } label: {
                                DessertDishRowView(dessert: dessertDish)
                            }
                        }
                    } else {
                        Text("You do not have any favorite items yet!")
                    }
                }
            }
            .onAppear {
                Task {
                    await firstDishViewModel.getFavoriteFirstDishes()
                    await secondDishViewModel.getFavoriteSecondDishes()
                    await dessertDishViewModel.getFavoriteDessertDishes()
                }
            }
            .alert(isPresented: $firstDishViewModel.showErrorMessage) {
                Alert(title: Text("Error"), message: Text("An error has occurred. Please try again later."), dismissButton: .cancel())
            }
            .alert(isPresented: $secondDishViewModel.showErrorMessage) {
                Alert(title: Text("Error"), message: Text("An error has occurred. Please try again later."), dismissButton: .cancel())
            }
            .alert(isPresented: $dessertDishViewModel.showErrorMessage) {
                Alert(title: Text("Error"), message: Text("An error has occurred. Please try again later."), dismissButton: .cancel())
            }
        }
    }
}
