//
//  SecondDishDetailViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import Foundation

class SecondDishDetailViewModel: ObservableObject{
    private let secondDishRepository: SecondDishRepository
    
    @Published var isLoading = false
    @Published var second: Second?
    @Published var error: Error?
    @Published var isFavorite = false

    init(secondDishRepository: SecondDishRepository) {
        self.secondDishRepository = secondDishRepository
    }

    @MainActor
    func getSecondDish(id: Int) async {
        error = nil
        isLoading = true
        
        do {
            second = try await secondDishRepository.getSecondDish(id: id)
        } catch (let fetchError) {
            error = fetchError
        }
        
        isLoading = false
        await isFavoriteSecondDish(second: second!)
    }

    @MainActor
    func addFavoriteSecondDish(second: Second) async {
        error = nil
        
        do {
            try await secondDishRepository.addFavoriteSecondDish(second: second)
            isFavorite = true
            try  await secondDishRepository.saveFavoriteSecondDishes()
        } catch (let addError) {
            error = addError
        }
    }

    @MainActor
    func removeFavoriteSecondDish(second: Second) async {
        error = nil
        
        do {
            try await secondDishRepository.removeFavoriteSecondDish(second: second)
            isFavorite = false
            try  await secondDishRepository.saveFavoriteSecondDishes()
        } catch (let removeError) {
            error = removeError
        }
    }

    @MainActor
    func isFavoriteSecondDish(second: Second) async {
        error = nil
        
        do {
            isFavorite = try await secondDishRepository.isFavoriteSecondDish(second: second)
        } catch (let checkError) {
            error = checkError
        }
    }
}
