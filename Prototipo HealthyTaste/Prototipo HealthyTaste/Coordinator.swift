//
//  Coordinator.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation


class Coordinator: ObservableObject{
    private let firstDishService: FirstDishService
    
    init(mock: Bool = false) {
        let netWorkClient = URLSessionNetworkClient()
        self.firstDishService = mock ? MockFirstDishService(): LiveFirstDishService(networkClient: netWorkClient)
    }
    // MARK: - FirstDishView
    func makeFirstDishView() -> FirstDishListView{
        FirstDishListView(firstDishViewModel: makeFirstDishViewViewModel())
    }
    private func makeFirstDishViewViewModel() -> FirstDishViewModel{
        .init(fistDishService: firstDishService)
    }
    //MARK: - FirstDishDetailView
    func makeFirstDishDetailView(first: First) -> FirstDishDetailView{
        .init(firstDish: first)
    }
}
