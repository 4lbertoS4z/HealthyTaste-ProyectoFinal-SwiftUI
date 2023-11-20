//
//  DessertDishRepository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct DessertDishRepository{
    private let remoteService: DessertDishRemoteService
    private let localService:
    DessertDishLocalService
    
    init(remoteService: DessertDishRemoteService, localService: DessertDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getDessertDishes() async throws -> [Dessert]{
        do{
            let remoteDessertDishes = try await
            remoteService.getDessertDishes()
            try localService.save(dessertDishes: remoteDessertDishes)
            return remoteDessertDishes
        }catch{
            return try localService.getDessertDishes()
        }
    }
    func getDessertDish(id: Int) async throws -> Dessert {
        return try await remoteService.getDessertDish(id: id)
    }
    
    func getFavoriteDessertDish() async throws -> [Dessert]{
        return try await localService.getFavoriteDessertDish()
    }
    
    func addFavoriteDessertDish(dessert: Dessert) async throws{
        try await localService.addFavoriteDessertDish(dessert: dessert)
    }
    
    func removeFavoriteDessertDish(dessert: Dessert) async throws{
        try await localService.removeFavoriteDessertDish(dessert: dessert)
    }
    
    func isFavoriteDessertDish(dessert: Dessert) async throws -> Bool{
        return try await localService.isFavoriteDessertDish(dessert: dessert)
    }
    func saveFavoriteDessertDishes() async throws {
           let favorites = try await localService.getFavoriteDessertDish()
        try  localService.saveFavorites(favorites)
       }
}


