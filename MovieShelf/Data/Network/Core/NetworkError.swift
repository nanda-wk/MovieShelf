//
//  NetworkError.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidStatusCode(Int)
    case decodeError(Error)

    var description: String {
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .invalidResponse:
            "Invalid Response"
        case .invalidData:
            "Invalid Data"
        case let .invalidStatusCode(code):
            "Invalid Status Code: \(code)"
        case let .decodeError(error):
            "Decode Error: \(error.localizedDescription)"
        }
    }
}
