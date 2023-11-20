//
//  MockSecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

class MockSecondDishLocalService: SecondDishLocalService{
    
    
    private var secondDishes = [Second]()
    
    func getSecondDishes() throws -> [Second] {
        secondDishes
    }
    
    func save(secondDishes: [Second]) throws {
        self.secondDishes = secondDishes
    }
    func getFavoriteSecondDish() async throws -> [Second] {
        return []
    }
    
    func addFavoriteSecondDish(second: Second) async throws {
        print("Added to favorites")
    }
    
    func removeFavoriteSecondDish(second: Second) async throws {
        print("Removed from favorites")
    }
    
    func isFavoriteSecondDish(second: Second) async throws -> Bool {
        return true
    }
    
    func saveFavorites(_ favorites: [Second]) throws {
        print("Saved to favorites")
    }
}

