//
//  SecondDishRespository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct SecondDishRepository{
    private let remoteService: SecondDishRemoteService
    private let localService:
    SecondDishLocalService
    
    init(remoteService: SecondDishRemoteService, localService: SecondDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getSecondDishes() async throws -> [Second]{
        do{
            let remoteSecondDishes = try await
            remoteService.getSecondDishes()
            try localService.save(secondDishes: remoteSecondDishes)
            return remoteSecondDishes
        }catch{
            return try localService.getSecondDishes()
        }
    }
    func getSecondDish(id: Int) async throws -> Second {
        return try await remoteService.getSecondDish(id: id)
    }
    
    func getFavoriteSecondDish() async throws -> [Second]{
        return try await localService.getFavoriteSecondDish()
    }
    
    func addFavoriteSecondDish(second: Second) async throws{
        try await localService.addFavoriteSecondDish(second: second)
    }
    
    func removeFavoriteSecondDish(second: Second) async throws{
        try await localService.removeFavoriteSecondDish(second: second)
    }
    
    func isFavoriteSecondDish(second: Second) async throws -> Bool{
        return try await localService.isFavoriteSecondDish(second: second)
    }
    func saveFavoriteSecondDishes() async throws {
           let favorites = try await localService.getFavoriteSecondDish()
        try  localService.saveFavorites(favorites)
       }
}
