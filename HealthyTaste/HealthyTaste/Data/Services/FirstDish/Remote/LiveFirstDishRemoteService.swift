//
//  LiveFirstDishService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation

struct LiveFirstDishRemoteService: FirstDishRemoteService{
   
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getFirstDishes() async throws -> [First] {
        return try await networkClient.get(url: ApiConstants.firstDishUrl)
    }
    
    func getFirstDish(id: Int) async throws -> First {
        let url = "\(ApiConstants.firstDishUrl)/\(id)" // Construye la URL con el ID del plato
        return try await networkClient.get(url: url)
    }
    
}
