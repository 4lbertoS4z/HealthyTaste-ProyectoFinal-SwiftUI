//
//  UserDefaultsDessertDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation
struct UserDefaultsDessertDishLocalService: DessertDishLocalService{
    
    
    private let dessertDishesKey = "Dessert"
    private let favoritesKey = "FavoriteDessertDishes"
    
    func getDessertDishes() throws -> [Dessert] {
        guard let data = UserDefaults.standard.data(forKey: dessertDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([Dessert].self, from: data)
    }
    
    func save(dessertDishes: [Dessert]) throws {
        let data = try JSONEncoder().encode(dessertDishes)
        UserDefaults.standard.set(data, forKey: dessertDishesKey)
    }
    func getFavoriteDessertDish() async throws -> [Dessert] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return []
        }
        return try JSONDecoder().decode([Dessert].self, from: data)
    }
    
    func addFavoriteDessertDish(dessert: Dessert) async throws {
        var favorites = try await getFavoriteDessertDish()
        if !favorites.contains(where: { $0.id == dessert.id }) {
            favorites.append(dessert)
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func removeFavoriteDessertDish(dessert: Dessert) async throws {
        var favorites = try await getFavoriteDessertDish()
        favorites.removeAll { $0.id == dessert.id }
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    
    func isFavoriteDessertDish(dessert: Dessert) async throws -> Bool {
        let dessertDishes = try await getFavoriteDessertDish()
        
        return dessertDishes.contains { fd in
            fd.id == dessert.id
        }
    }
    
    func saveFavorites(_ favorites: [Dessert]) throws {
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
}
