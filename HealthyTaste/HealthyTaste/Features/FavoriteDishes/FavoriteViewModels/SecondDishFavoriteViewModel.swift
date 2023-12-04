//
//  SecondDishFavoriteViewModel.swift
//  HealthyTaste
//
//  Created by alberto saz on 20/11/23.
//

import Foundation

class SecondDishFavoriteViewModel: ObservableObject{
    let secondDishRepository: SecondDishRepository
    @Published private(set) var favoriteSecondDish = [Second]()
    @Published var showErrorMessage = false
    
    init(secondDishRepository: SecondDishRepository) {
        self.secondDishRepository = secondDishRepository
    }
    
    @MainActor
    func getFavoriteSecondDishes() async{
        do{
            favoriteSecondDish = try await
            secondDishRepository.getFavoriteSecondDish()
            showErrorMessage = false
        } catch{
            showErrorMessage = true
        }
    }
    
    @MainActor
    func addFavoriteSecondDish(second:Second) async{
        do{
            try await secondDishRepository.addFavoriteSecondDish(second: second)
            await getFavoriteSecondDishes()
        }catch{
            showErrorMessage = true
        }
    }
    @MainActor
    func removeFavoriteSecondDish(second: Second) async {
        do {
            try await secondDishRepository.removeFavoriteSecondDish(second: second)
            await getFavoriteSecondDishes() 
        } catch {
            showErrorMessage = true
        }
    }
}
