//
//  ViewModel.swift
//  MyFrirendList
//
//  Created by Sy Lee on 2022/05/18.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var friendList: [Friend] = []
    
    var cancellable = Set<AnyCancellable>()
    let urlString = "https://randomuser.me/api/?results=50"
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else {
            print("There is no URL")
            return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap{ output -> Data in
                return output.data
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .sink { completion in
                print("completion : \(completion)")
            } receiveValue: { [weak self] response in
               let responseFriends = response.results
                self?.friendList = responseFriends
            }.store(in: &cancellable)
    }
}
