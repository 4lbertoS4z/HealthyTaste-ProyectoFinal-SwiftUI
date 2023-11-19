//
//  FirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

protocol FirstDishLocalService{
    func getFirstDishes() throws ->[First]
    
    func save(firstDishes:[First]) throws
    
    func getFavoriteFirstDish() async throws -> [First]
    
    func addFavoriteFirstDish(first: First) async throws
    
    func removeFavoriteFirstDish(first: First) async throws
    
    func isFavoriteFirstDish(first: First) async throws -> Bool
    
    func saveFavorites(_ favorites: [First]) throws}
