//
//  LiveDessertDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct LiveDessertDishRemoteService: DessertDishRemoteService{
   
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getDessertDishes() async throws -> [Dessert] {
        return try await networkClient.get(url: ApiConstants.dessertDishUrl)
    }
    func getDessertDish(id: Int) async throws -> Dessert {
        let url = "\(ApiConstants.dessertDishUrl)/\(id)" // Construye la URL con el ID del plato
        return try await networkClient.get(url: url)
    }
}
