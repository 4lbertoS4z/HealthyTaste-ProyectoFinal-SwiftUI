//
//  Coordinator.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation


class Coordinator: ObservableObject{
    private let firstDishRepository: FirstDishRepository
    
    init(mock: Bool = false) {
        let netWorkClient = URLSessionNetworkClient()
        let firstDishRemoteService: FirstDishRemoteService = mock ? MockFirstDishRemoteService(): LiveFirstDishRemoteService(networkClient: netWorkClient)
        let firstDishLocalService: FirstDishLocalService = mock ? MockFirstDishLocalService(): UserDefaultsFirstDishLocalService()
        
        firstDishRepository = FirstDishRepository(remoteService: firstDishRemoteService, localService: firstDishLocalService)
        
    }
    // MARK: - FirstDishView
    func makeFirstDishView() -> FirstDishListView{
        FirstDishListView(firstDishViewModel: makeFirstDishViewViewModel())
    }
    private func makeFirstDishViewViewModel() -> FirstDishViewModel{
        .init(firstDishRepository: firstDishRepository)
    }
    //MARK: - FirstDishDetailView
    func makeFirstDishDetailView(first: First) -> FirstDishDetailView{
        .init(firstDish: first)
    }
}
