//
//  NetworkClient.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//


protocol NetworkClient {
    func get<T: Decodable>(url: String) async throws -> T
}
