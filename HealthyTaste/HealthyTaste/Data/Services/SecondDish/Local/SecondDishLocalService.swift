//
//  SecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

protocol SecondDishLocalService{
    func getSecondDishes() throws ->[Second]
    
    func save(secondDishes:[Second]) throws
    
    func getFavoriteSecondDish() async throws -> [Second]
    
    func addFavoriteSecondDish(second: Second) async throws
    
    func removeFavoriteSecondDish(second: Second) async throws
    
    func isFavoriteSecondDish(second: Second) async throws -> Bool
    
    func saveFavorites(_ favorites: [Second]) throws
    
}
