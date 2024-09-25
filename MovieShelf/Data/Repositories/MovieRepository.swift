//
//  MovieRepository.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-26.
//

import Foundation

class MovieRepository {
    private let remoteDataSource = TMDBRemoteDataSource()

    func fetchPopularMovies() async {
        let result: PopularMovieResponse
        do {
            result = try await remoteDataSource.fetchMovies(request: .popularMovie)
            print(result)
        } catch let error as NetworkError {
            print(error.description)
        } catch {
            print(error.localizedDescription)
        }

    }
}
