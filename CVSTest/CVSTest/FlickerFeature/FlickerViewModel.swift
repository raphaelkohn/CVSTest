//
//  FlickerViewModel.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation
import EasyDI
import Combine

@MainActor
protocol FlickerViewModelProtocol: ObservableObject {
    var flickerItems: [FlickerItem] { get set }
    var tagSearch: String { get set }
    var errorMessage: String { get set }
}

class FlickerViewModel: FlickerViewModelProtocol {
    @Published var tagSearch: String = ""
    @Published var flickerItems: [FlickerItem] = []
    @Published var errorMessage: String = ""
    
    @Inject
    var client: FlickerClientProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $tagSearch
            .print()
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .filter { $0.count > 3 }
            .print()
            .sink { _ in
            } receiveValue: { [weak self] value in
                self?.search(value)
            }
            .store(in: &cancellables)
    }
    
    private func search(_ s: String) {
        
        Task { [weak self] in
            if let model = try? await self?.client.retrieveFrom(tag:s) {
                DispatchQueue.main.async {
                    self?.flickerItems = model.items
                }
            }
        }
        
//        self.client.retrieveTagPublisher(tag: s)
//            .receive(on: DispatchQueue.main)
//            .print()
//            .sink { completion in
//                if case let .failure(error) = completion {
//                    self.errorMessage = error.localizedDescription
//                }
//            } receiveValue: { [weak self] value in
//                self?.flickerItems = value.items
//            }
//            .store(in: &cancellables)
    }
}
