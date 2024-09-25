//
//  RequestConfiguration.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-25.
//

import Alamofire
import Foundation

let env = ProcessInfo.processInfo.environment

protocol RequestConfiguration {
    var baseURL: String { get }

    var urlString: String { get }

    var endpoint: String { get }

    var method: HTTPMethod { get }

    var url: URLConvertible { get }

    var parameters: Parameters? { get }

    var encoding: ParameterEncoding { get }

    var headers: HTTPHeaders? { get }

    var interceptor: RequestInterceptor? { get }
}

extension RequestConfiguration {
    var baseURL: String {
        env["BASE_URL"] ?? ""
    }

    var url: URLConvertible {
        let url = URL(string: urlString)?.appending(component: endpoint)
        return url?.absoluteString ?? "\(baseURL)\(endpoint)"
    }

    var headers: HTTPHeaders? {
        HTTPHeaders(arrayLiteral: .authorization(bearerToken: env["TMDB_API_KEY"] ?? ""))
    }

    var interceptor: RequestInterceptor? { nil }
}
