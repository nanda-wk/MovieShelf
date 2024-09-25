//
//  TMDBRequestConfiguration.swift
//  MovieShelf
//
//  Created by Nanda WK on 2024-09-26.
//

import Alamofire
import Foundation

enum TMDBRequestConfiguration: RequestConfiguration {
    case discoverMovie
    case discoverTV
    case popularMovie
    case popularTV

    var urlString: String {
        switch self {
        case .discoverMovie, .discoverTV:
            baseURL + "/discover"
        case .popularMovie:
            baseURL + "/movie"
        case .popularTV:
            baseURL + "/tv"
        }
    }

    var endpoint: String {
        switch self {
        case .discoverMovie:
            "movie"
        case .discoverTV:
            "tv"
        case .popularMovie, .popularTV:
            "popular"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var parameters: Parameters? {
        ["language": "en-US"]
    }

    var encoding: ParameterEncoding {
        URLEncoding.queryString
    }
}
