//
//  FirstDishRepository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//
import Foundation

struct FirstDishRepository{
    private let remoteService: FirstDishRemoteService
    private let localService: FirstDishLocalService
    
    init(remoteService: FirstDishRemoteService, localService: FirstDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getFirstDishes() async throws -> [First]{
        do{
            let remoteFirstDishes = try await remoteService.getFirstDishes()
            try localService.save(firstDishes: remoteFirstDishes)
            return remoteFirstDishes
        }catch{
            return try localService.getFirstDishes()
        }
    }
    func getFirstDish(id: Int) async throws -> First {
        return try await remoteService.getFirstDish(id: id)
    }
    
    func getFavoriteFirstDish() async throws -> [First]{
        return try await localService.getFavoriteFirstDish()
    }
    
    func addFavoriteFirstDish(first: First) async throws{
        try await localService.addFavoriteFirstDish(first: first)
    }
    
    func removeFavoriteFirstDish(first: First) async throws{
        try await localService.removeFavoriteFirstDish(first: first)
    }
    
    func isFavoriteFirstDish(first: First) async throws -> Bool{
        return try await localService.isFavoriteFirstDish(first: first)
    }
    func saveFavoriteFirstDishes() async throws {
           let favorites = try await localService.getFavoriteFirstDish()
        try  localService.saveFavorites(favorites)
       }
}
