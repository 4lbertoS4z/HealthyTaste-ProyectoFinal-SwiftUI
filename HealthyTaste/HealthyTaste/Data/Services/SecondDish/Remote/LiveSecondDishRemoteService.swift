//
//  LiveSecondDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct LiveSecondDishRemoteService: SecondDishRemoteService{
    
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getSecondDishes() async throws -> [Second] {
        return try await networkClient.get(url: ApiConstants.secondDishUrl)
    }
    func getSecondDish(id: Int) async throws -> Second {
        let url = "\(ApiConstants.secondDishUrl)/\(id)" // Construye la URL con el ID del plato
        return try await networkClient.get(url: url)
    }
}
