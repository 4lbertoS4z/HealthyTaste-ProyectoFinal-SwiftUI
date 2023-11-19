//
//  UserDefaultsFirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

import Foundation

struct UserDefaultsFirstDishLocalService: FirstDishLocalService{
    
    
    
    
    
    private let firstDishesKey = "First"
    private let favoritesKey = "FavoriteFirstDishes"
    func getFirstDishes() throws -> [First] {
        guard let data = UserDefaults.standard.data(forKey: firstDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([First].self, from: data)
    }
    
    func save(firstDishes: [First]) throws {
        let data = try JSONEncoder().encode(firstDishes)
        UserDefaults.standard.set(data, forKey: firstDishesKey)
    }
    
    func getFavoriteFirstDish() async throws -> [First] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else {
            return []
        }
        return try JSONDecoder().decode([First].self, from: data)
    }
    
    func addFavoriteFirstDish(first: First) async throws {
        var favorites = try await getFavoriteFirstDish()
        if !favorites.contains(where: { $0.id == first.id }) {
            favorites.append(first)
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func removeFavoriteFirstDish(first: First) async throws {
        var favorites = try await getFavoriteFirstDish()
        favorites.removeAll { $0.id == first.id }
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    
    func saveFavorites(_ favorites: [First]) throws {
        let data = try JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: favoritesKey)
    }
    func isFavoriteFirstDish(first: First) async throws -> Bool {
        let firstDishes = try await getFavoriteFirstDish()
        
        return firstDishes.contains { fd in
            fd.id == first.id
        }
    }
    
}
