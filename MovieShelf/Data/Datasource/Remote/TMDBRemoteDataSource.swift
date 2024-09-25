//
//  TMDBRemoteDataSource.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-26.
//

import Foundation

class TMDBRemoteDataSource {
    private let network = Network.shared

    func fetchMovies(request: TMDBRequestConfiguration) async throws -> PopularMovieResponse {
        try await network.performRequest(request, for: PopularMovieResponse.self)
    }

}
