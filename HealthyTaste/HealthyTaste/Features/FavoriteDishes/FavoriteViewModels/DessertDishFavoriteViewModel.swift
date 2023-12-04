//
//  DessertDishFavoriteViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import Foundation

class DessertDishFavoriteViewModel: ObservableObject{
    let dessertDishRepository: DessertDishRepository
    @Published private(set) var favoriteDessertDish = [Dessert]()
    @Published var showErrorMessage = false
    
    init(dessertDishRepository: DessertDishRepository) {
        self.dessertDishRepository = dessertDishRepository
    }
    
    @MainActor
    func getFavoriteDessertDishes() async{
        do{
            favoriteDessertDish = try await
            dessertDishRepository.getFavoriteDessertDish()
            showErrorMessage = false
        } catch{
            showErrorMessage = true
        }
    }
    
    @MainActor
    func addFavoriteDessertDish(dessert:Dessert) async{
        do{
            try await dessertDishRepository.addFavoriteDessertDish(dessert: dessert)
            await getFavoriteDessertDishes()
        }catch{
            showErrorMessage = true
        }
    }
    @MainActor
    func removeFavoriteSecondDish(dessert: Dessert) async {
        do {
            try await dessertDishRepository.removeFavoriteDessertDish(dessert: dessert)
            await getFavoriteDessertDishes() 
        } catch {
            showErrorMessage = true
        }
    }
}

