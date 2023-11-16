//
//  FirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

protocol FirstDishLocalService{
    func getFirstDishes() throws ->[First]
    func save(firstDishes:[First]) throws
}
