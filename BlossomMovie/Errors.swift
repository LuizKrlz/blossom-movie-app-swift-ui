//
//  Errors.swift
//  BlossomMovie
//
//  Created by Luiz Correa on 11/12/2025.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)

    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "API configuration file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return
                "Failed to load data from API configuration file: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return
                "Failed to decode API configuration: \(error.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed

    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let err):
            return "Bad URL response: \(err.localizedDescription)"
        case .missingConfig:
            return "Missing API configuration"
        case .urlBuildFailed:
            return "Failed to build URL."
        }
    }
}
