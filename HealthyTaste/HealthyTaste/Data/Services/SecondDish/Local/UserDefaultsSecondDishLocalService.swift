//
//  UserDefaultsSecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation
struct UserDefaultsSecondDishLocalService: SecondDishLocalService{
    
    
    private let secondDishesKey = "Second"
    private let favoritesKey = "FavoriteSecondDishes"
    
    func getSecondDishes() throws -> [Second] {
        guard let data = UserDefaults.standard.data(forKey: secondDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([Second].self, from: data)
    }
    
    func save(secondDishes: [Second]) throws {
        let data = try JSONEncoder().encode(secondDishes)
        UserDefaults.standard.set(data, forKey: secondDishesKey)
    }
    func getFavoriteSecondDish() async throws -> [Second] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return []
        }
        return try JSONDecoder().decode([Second].self, from: data)
    }
    
    func addFavoriteSecondDish(second: Second) async throws {
        var favorites = try await getFavoriteSecondDish()
        if !favorites.contains(where: { $0.id == second.id }) {
            favorites.append(second)
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func removeFavoriteSecondDish(second: Second) async throws {
        var favorites = try await getFavoriteSecondDish()
        favorites.removeAll { $0.id == second.id }
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    
    func isFavoriteSecondDish(second: Second) async throws -> Bool {
        let secondDishes = try await getFavoriteSecondDish()
        
        return secondDishes.contains { fd in
            fd.id == second.id
        }
    }
    
    func saveFavorites(_ favorites: [Second]) throws {
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
}
