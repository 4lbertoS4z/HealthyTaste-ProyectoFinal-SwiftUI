//
//  MockFirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

class MockFirstDishLocalService: FirstDishLocalService{
    func saveFavorites(_ favorites: [First])  throws{
        print("Saved to favorites")
    }
    
    
    private var firstDishes = [First]()
    
    func getFirstDishes() throws -> [First] {
        firstDishes
    }
    
    func save(firstDishes: [First]) throws {
        self.firstDishes = firstDishes
    }
    
    func getFavoriteFirstDish() async throws -> [First] {
        return []
    }
    
    func addFavoriteFirstDish(first: First) async throws {
        print("Added to favorites")
    }
    
    func removeFavoriteFirstDish(first: First) async throws {
        print("Removed from favorites")
    }
    
    func isFavoriteFirstDish(first: First) async throws -> Bool {
        return true
    }
}
