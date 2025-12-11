//
//  ViewModel.swift
//  BlossomMovie
//
//  Created by Luiz Correa on 11/12/2025.
//

import Foundation

@Observable
class ViewModel {
    var tredingMovies: [Title] = []
    
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    // like a private function to set a property
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    
    func getTitles() async {
        homeStatus = .fetching
        
        do {
            tredingMovies = try await dataFetcher.fetchTitles(for: "movie")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
