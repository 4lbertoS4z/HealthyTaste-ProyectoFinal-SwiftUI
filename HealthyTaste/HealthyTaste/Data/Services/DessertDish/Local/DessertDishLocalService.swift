//
//  DessertDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

protocol DessertDishLocalService{
    func getDessertDishes() throws ->[Dessert]
    func save(dessertDishes:[Dessert]) throws
    
    func getFavoriteDessertDish() async throws -> [Dessert]
    
    func addFavoriteDessertDish(dessert: Dessert) async throws
    
    func removeFavoriteDessertDish(dessert: Dessert) async throws
    
    func isFavoriteDessertDish(dessert: Dessert) async throws -> Bool
    
    func saveFavorites(_ favorites: [Dessert]) throws
}
