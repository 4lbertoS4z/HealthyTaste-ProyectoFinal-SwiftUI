//
//  DessertDishDetailViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import Foundation
class DessertDishDetailViewModel: ObservableObject{
    private let dessertDishRepository: DessertDishRepository
    
    @Published var isLoading = false
    @Published var dessert: Dessert?
    @Published var error: Error?
    @Published var isFavorite = false

    init(dessertDishRepository: DessertDishRepository) {
        self.dessertDishRepository = dessertDishRepository
    }

    @MainActor
    func getDessertDish(id: Int) async {
        error = nil
        isLoading = true
        
        do {
            dessert = try await dessertDishRepository.getDessertDish(id: id)
        } catch (let fetchError) {
            error = fetchError
        }
        
        isLoading = false
        await isFavoriteDessertDish(dessert: dessert!)
    }

    @MainActor
    func addFavoriteDessertDish(dessert: Dessert) async {
        error = nil
        
        do {
            try await dessertDishRepository.addFavoriteDessertDish(dessert: dessert)
            isFavorite = true
            try  await dessertDishRepository.saveFavoriteDessertDishes()
        } catch (let addError) {
            error = addError
        }
    }

    @MainActor
    func removeFavoriteDessertDish(dessert: Dessert) async {
        error = nil
        
        do {
            try await dessertDishRepository.removeFavoriteDessertDish(dessert: dessert)
            isFavorite = false
            try  await dessertDishRepository.saveFavoriteDessertDishes()
        } catch (let removeError) {
            error = removeError
        }
    }

    @MainActor
    func isFavoriteDessertDish(dessert: Dessert) async {
        error = nil
        
        do {
            isFavorite = try await dessertDishRepository.isFavoriteDessertDish(dessert: dessert)
        } catch (let checkError) {
            error = checkError
        }
    }
}
