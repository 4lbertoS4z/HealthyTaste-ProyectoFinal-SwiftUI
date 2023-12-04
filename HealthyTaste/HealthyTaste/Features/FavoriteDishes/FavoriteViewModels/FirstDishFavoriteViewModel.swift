//
//  FirstDishFavoriteViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 17/11/23.
//

import Foundation

class FirstDishFavoriteViewModel: ObservableObject{
    let firstDishRepository: FirstDishRepository
    @Published private(set) var favoriteFirstDishs = [First]()
    @Published var showErrorMessage = false
    
    init(firstDishRepository: FirstDishRepository){
        self.firstDishRepository = firstDishRepository
        
    }
    @MainActor
        func getFavoriteFirstDishes() async {
            do {
                favoriteFirstDishs = try await firstDishRepository.getFavoriteFirstDish()
                showErrorMessage = false
            } catch {
                showErrorMessage = true
            }
        }

        @MainActor
        func addFavoriteFirstDish(first: First) async {
            do {
                try await firstDishRepository.addFavoriteFirstDish(first: first)
                await getFavoriteFirstDishes() // Recarga la lista de favoritos
            } catch {
                showErrorMessage = true
            }
        }

        @MainActor
        func removeFavoriteFirstDish(first: First) async {
            do {
                try await firstDishRepository.removeFavoriteFirstDish(first: first)
                await getFavoriteFirstDishes() 
            } catch {
                showErrorMessage = true
            }
        }
}
