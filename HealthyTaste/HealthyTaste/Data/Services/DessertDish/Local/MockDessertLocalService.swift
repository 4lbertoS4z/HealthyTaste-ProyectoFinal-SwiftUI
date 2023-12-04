//
//  MockFirstDessertLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

class MockDessertLocalService: DessertDishLocalService{
    func getFavoriteDessertDish() async throws -> [Dessert] {
        return []
    }
    
    func addFavoriteDessertDish(dessert: Dessert) async throws {
        print("Added to favorites")
    }
    
    func removeFavoriteDessertDish(dessert: Dessert) async throws {
        print("Removed from favorites")
    }
    
    func isFavoriteDessertDish(dessert: Dessert) async throws -> Bool {
        return true
    }
    
    func saveFavorites(_ favorites: [Dessert]) throws {
        print("Saved to favorites")
    }
    
    private var dessertDishes = [Dessert]()
    
    func getDessertDishes() throws -> [Dessert] {
        dessertDishes
    }
    
    func save(dessertDishes: [Dessert]) throws {
        self.dessertDishes = dessertDishes
    }
}

