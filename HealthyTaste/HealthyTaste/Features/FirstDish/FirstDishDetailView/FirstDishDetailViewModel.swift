//
//  FirstDishDetailViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 17/11/23.
//

import Foundation

class FirstDishDetailViewModel: ObservableObject {
    private let firstDishRepository: FirstDishRepository
    
    @Published var isLoading = false
    @Published var first: First?
    @Published var error: Error?
    @Published var isFavorite = false

    init(firsDishRepository: FirstDishRepository) {
        self.firstDishRepository = firsDishRepository
    }

    @MainActor
    func getFirstDish(id: Int) async {
        error = nil
        isLoading = true
        
        do {
            first = try await firstDishRepository.getFirstDish(id: id)
        } catch (let fetchError) {
            error = fetchError
        }
        
        isLoading = false
        await isFavoriteFirstDish(first: first!)
    }

    @MainActor
    func addFavoriteFirstDish(first: First) async {
        error = nil
        
        do {
            try await firstDishRepository.addFavoriteFirstDish(first: first)
            isFavorite = true
            try  await firstDishRepository.saveFavoriteFirstDishes()
        } catch (let addError) {
            error = addError
        }
    }

    @MainActor
    func removeFavoriteFirstDish(first: First) async {
        error = nil
        
        do {
            try await firstDishRepository.removeFavoriteFirstDish(first: first)
            isFavorite = false
            try  await firstDishRepository.saveFavoriteFirstDishes()
        } catch (let removeError) {
            error = removeError
        }
    }

    @MainActor
    func isFavoriteFirstDish(first: First) async {
        error = nil
        
        do {
            isFavorite = try await firstDishRepository.isFavoriteFirstDish(first: first)
        } catch (let checkError) {
            error = checkError
        }
    }
}

