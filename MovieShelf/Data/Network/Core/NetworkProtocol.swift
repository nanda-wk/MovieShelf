//
//  NetworkProtocol.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-25.
//

import Alamofire
import Foundation

protocol NetworkProtocol {
    func performRequest<T: Decodable>(
        _ configuration: RequestConfiguration,
        for type: T.Type
    ) async throws -> T
}

extension NetworkProtocol {
    func request<T: Decodable>(
        session: Session,
        configuration: RequestConfiguration,
        decoder: JSONDecoder
    ) async throws -> T {
        let dataTask = session.request(
            configuration.url,
            method: configuration.method,
            parameters: configuration.parameters,
            encoding: configuration.encoding,
            headers: configuration.headers,
            interceptor: configuration.interceptor
        )
        .validate()
        .serializingData()

        let response = await dataTask.response

        guard let statusCode = response.response?.statusCode else { throw NetworkError.invalidResponse }

        if !(200 ... 299).contains(statusCode) {
            throw NetworkError.invalidStatusCode(statusCode)
        }

        guard let data = response.data else { throw NetworkError.invalidData }

        do {
            let decodedResponse = try decoder.decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodeError(error)
        }
    }
}
